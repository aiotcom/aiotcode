#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    esp8266_fd = ::open("/dev/esp8266",O_RDWR);
    if(esp8266_fd>0){
        qDebug() << tr("open /dev/esp8266 ok\r\n");
    }
    else{
        qDebug() << tr("open /dev/esp8266 failure\r\n");
    }

    esp8266io_fd = open("/dev/esp8266", O_RDWR);
    if (esp8266io_fd < 0) {
        perror("**/dev/esp8266\r\n");
        exit(1);
    }

    relay_fd = open("/dev/relay", O_RDWR);
    if (relay_fd < 0) {
        perror("**/dev/relay");
        exit(1);
    }

    sht20_fd = open("/dev/sht20", O_RDWR);
    if (sht20_fd < 0) {
        perror("**/dev/sht20");
        exit(1);
    }
    arg_0 = 0;
    ioctl(esp8266io_fd, IOCTRL_CMD_RST, &arg_0);
    //msleep(1);
    t_delay.start();
    while(t_delay.elapsed()<1000);
    arg_1 = 1;
    ioctl(esp8266io_fd, IOCTRL_CMD_RST, &arg_1);

    esp8266_open((char*)"/dev/ttymxc2",&esp8266_serial_fd,115200);
    m_timer_esp8266_Init = new QTimer;
    m_timer_ReadSHT20    = new QTimer;
    m_timer_connect_OneNET = new QTimer;
    this->InitTimer();

    pcmd[0] = (unsigned char*)"AT\r\n";
    pcmd[1] = (unsigned char*)"AT+CWMODE=3\r\n";//设置模式为AP+STA
    pcmd[2] = (unsigned char*)"AT+CIFSR\r\n";	//查询IP地址
    pcmd[3] = (unsigned char*)"AT+CWJAP=\"bacheng\",\"f0f0f0f0f0\"\r\n";//设置SID和PWD连接网络
    pcmd[4] = (unsigned char*)"AT+CIPSTART=\"TCP\",\"183.230.40.40\",1811\r\n";//设置为TCP协议传输并指定IP和端口号
    pcmd[5] = (unsigned char*)"AT+CIPMODE=1\r\n";//透传
    pcmd[6] = (unsigned char*)"AT+CIPSEND\r\n";
    pcmd[7] = (unsigned char*)"*213941#0001#sample*";
    pcmd[8] = (unsigned char*)0;
    connectStatus = 0;
    ui->pushButton_Connect->setText("关  闭");
    ui->m_lcdNumber_Humi->display(76);
    ui->m_lcdNumber_Temp->display(12.3);
    ui->m_label_Relay1_pic->setPixmap(QPixmap("./relay_off.jpg"));
    ui->m_label_Relay2_pic->setPixmap(QPixmap("./relay_off.jpg"));
    m_relay1_state = 0;
    m_relay2_state = 0;
    ui->m_lcdNumber_Temp->display(0.0);
    ui->m_lcdNumber_Humi->display(0.0);

    sensorState = UPDATE_HUMI;
    isConnectOneNET = 0;
/*
 * c_char = "asdfasd";
    QString qstr = QString(QLatin1String(c_char));
    if(QString::compare(qstr,"1234") == 0){
        qDebug("same\r\n");
    }
*/
}

MainWindow::~MainWindow()
{
    delete ui;
}
void MainWindow::InitTimer()
{
    qDebug() << tr("timer init start\r\n");

   //设置定时器是否为单次触发。默认为 false 多次触发
   m_timer_esp8266_Init->setSingleShot(false);
   //启动或重启定时器, 并设置定时器时间：毫秒
   m_timer_esp8266_Init->start(1000);
   //定时器触发信号槽
   connect(m_timer_esp8266_Init, SIGNAL(timeout()), this, SLOT(esp8266_init()));

   //设置定时器是否为单次触发。默认为 false 多次触发
   m_timer_ReadSHT20->setSingleShot(false);
   //启动或重启定时器, 并设置定时器时间：毫秒
   m_timer_ReadSHT20->start(1000);
   //定时器触发信号槽
   connect(m_timer_ReadSHT20, SIGNAL(timeout()), this, SLOT(Read_SHT20()));

   //设置定时器是否为单次触发。默认为 false 多次触发
   m_timer_connect_OneNET->setSingleShot(false);
   //启动或重启定时器, 并设置定时器时间：毫秒
   m_timer_connect_OneNET->start(100);
   //定时器触发信号槽
   connect(m_timer_connect_OneNET, SIGNAL(timeout()), this, SLOT(connect_OneNET()));

   qDebug() << tr("timer init\r\n");
}
void MainWindow::connect_OneNET(void)
{
    QByteArray ba;
    unsigned char cmd[5];
    int light = 0,receivelen = 0,tmp;
    static int state = 0,count=0,flagcount = 0;
    QString QSTmp,str1;
    if(!isConnectOneNET){
        return;
    }
    if((++count)>=10){
        count = 0;
        QSTmp = str1.sprintf("%02d%02d%04d",m_Temp,m_Humi,light);
        ba=QSTmp.toLatin1();
        esp8266_send((unsigned char*)ba.data(),ba.length());
        //qDebug("send to wifi=%s\r\n",ba.data());
    }
    receivelen = esp8266_receive(receiveBuffer);
     if(receivelen){
        //qDebug("receive=%s\r\n",receiveBuffer);
        for(int i = 0;i<receivelen;i++){
            unsigned char c_char;
            c_char = receiveBuffer[i];
            if(c_char == '$'){
                flagcount = 1;
                cmd[0] = c_char;
            }
            else if((c_char == 'R')&&(flagcount == 1)){
                flagcount = 2;
                cmd[1] = c_char;
            }
            else if((flagcount == 2)&&((c_char == '1') || (c_char == '2'))){
                flagcount = 3;
                cmd[2] = c_char;
            }
            else if((flagcount == 3)&&((c_char == '0') || (c_char == '1'))){
                flagcount = 0xff;
                cmd[3] = c_char;
                cmd[4] = 0;
                //qDebug("get$\r\n");
                QString qstr = QString(QLatin1String((const char*)cmd));
                if(QString::compare(qstr,"$R10") == 0){
                    qDebug("$R10\r\n");
                    ui->m_label_Relay1_pic->setPixmap(QPixmap("./relay_off.jpg"));
                    tmp = 0;
                    ioctl(relay_fd, IOCTRL_CMD_RELAY_1, &tmp);
                    m_relay1_state = 0;
                }
                if(QString::compare(qstr,"$R11") == 0){
                    qDebug("$R11\r\n");
                    ui->m_label_Relay1_pic->setPixmap(QPixmap("./relay_on.jpg"));
                    tmp = 1;
                    ioctl(relay_fd, IOCTRL_CMD_RELAY_1, &tmp);
                    m_relay1_state = 1;
                }
                if(QString::compare(qstr,"$R20") == 0){
                    qDebug("$R20\r\n");
                    ui->m_label_Relay2_pic->setPixmap(QPixmap("./relay_off.jpg"));
                    tmp = 0;
                    ioctl(relay_fd, IOCTRL_CMD_RELAY_2, &tmp);
                    m_relay2_state = 0;
                }
                if(QString::compare(qstr,"$R21") == 0){
                    qDebug("$R21\r\n");
                    ui->m_label_Relay2_pic->setPixmap(QPixmap("./relay_on.jpg"));
                    tmp = 1;
                    ioctl(relay_fd, IOCTRL_CMD_RELAY_2, &tmp);
                    m_relay2_state = 1;
                }
            }
        }
        memset((void*)receive_buffer,0,200);
    }

        /*
        receiveBuffer[receivelen] = 0;
        qDebug("receive=%s\r\n",receiveBuffer);
        if(QString::compare(QString::fromUtf8((const char*)receiveBuffer),"button_relay2_on") == 0){
            ui->m_label_Relay2_pic->setPixmap(QPixmap("./relay_on.jpg"));
            tmp = 1;
            ioctl(relay_fd, IOCTRL_CMD_RELAY_2, &tmp);
            m_relay2_state = 1;
        }
        if(QString::compare(QString::fromUtf8((const char*)receiveBuffer),"button_relay2_off")==0){
            ui->m_label_Relay2_pic->setPixmap(QPixmap("./relay_off.jpg"));
            tmp = 0;
            ioctl(relay_fd, IOCTRL_CMD_RELAY_2, &tmp);
            m_relay2_state = 0;
        }
        if(QString::compare(QString::fromUtf8((const char*)receiveBuffer),"button_relay1_on")==0){
            ui->m_label_Relay1_pic->setPixmap(QPixmap("./relay_on.jpg"));
            tmp = 1;
            ioctl(relay_fd, IOCTRL_CMD_RELAY_1, &tmp);
            m_relay1_state = 1;
        }
        if(QString::compare(QString::fromUtf8((const char*)receiveBuffer),"button_relay1_off")==0){
            ui->m_label_Relay1_pic->setPixmap(QPixmap("./relay_off.jpg"));
            tmp = 0;
            ioctl(relay_fd, IOCTRL_CMD_RELAY_1, &tmp);
            m_relay1_state = 0;
        }*/
 }
void MainWindow::Read_SHT20(void)
{
    int contrl,temp,humi;
    int sensor_data;
    if(this->sensorState == UPDATE_TEMP){
        ::ioctl(sht20_fd, IOCTRL_CMD_READ_TEMP, &contrl);
        /*能够读取到数据*/
        if(::read(sht20_fd, (void*)&sensor_data, sizeof(sensor_data)))
        {
            temp = ((sensor_data) * 0.00268127) - 46.85;  //转换所得到的数据
            contrl = temp;
            m_Temp = temp;
            //qDebug("temp=%d\r\n",temp);
            ui->m_lcdNumber_Temp->display(temp);
        }
        sensorState = UPDATE_HUMI;
    }
    else if(this->sensorState == UPDATE_HUMI){
        ::ioctl(sht20_fd, IOCTRL_CMD_READ_HUMI, &contrl);
        if(::read(sht20_fd, (void*)&sensor_data, sizeof(sensor_data)))
        {
            humi = ((float)sensor_data * 0.00190735) - 6;  //转换所得到的数据
            contrl = humi;
            m_Humi = humi;
            //qDebug("humi=%d\r\n",humi);
            ui->m_lcdNumber_Humi->display(humi);
        }
        sensorState = UPDATE_TEMP;
    }
}
void MainWindow::esp8266_init(void)
{
    static int state = 0,cmdindex = 0;
    if(connectStatus == 0){
        state    = 0;
        cmdindex = 0;
        return;
    }
    qDebug("esp8266 timer timeout\r\n");
    if(state == 0){
        isConnectOneNET = 0;
        lseek(esp8266_serial_fd,0,SEEK_SET);
        send_at_cmd(pcmd[cmdindex],strlen((const char*)pcmd[cmdindex]));

        QString str = ui->m_textEdit_ConnectLog->toPlainText();
        QString str2;
        str+=str2.sprintf("%s\r\n",pcmd[cmdindex]);
        ui->m_textEdit_ConnectLog->clear();
        ui->m_textEdit_ConnectLog->append(str);

        memset(receive_buffer,0,200);
        state = 1;
    }
    else if(state == 1){
        state = 0;
        read(esp8266_serial_fd,receive_buffer,200);
        receive_buffer[199] = 0;
        if(strstr((const char*)receive_buffer,"OK")){
            cmdindex++;
        }
        else if(cmdindex == 7){
            //cmdindex++;
            qDebug("esp8266 init done\r\n");
            m_timer_esp8266_Init->stop();
            isConnectOneNET = 1;
            state = 2;
        }
    }
}
void MainWindow::send_at_cmd(unsigned char *cmd, unsigned char len)
{
    write(esp8266_serial_fd,cmd,len);
}
void MainWindow::esp8266_send(unsigned char *buf, int len)
{
    this->send_at_cmd(buf,len);
}
int MainWindow::esp8266_receive(unsigned char *buf)
{
    int nread;
    nread = read(esp8266_serial_fd,buf,200);
    return nread;
}

void MainWindow::on_pushButton_Connect_clicked()
{
    QString str,str1;
    QByteArray ba;
    char *pbuf;
    connectStatus = 1 - connectStatus;
    if(connectStatus){
        ui->m_textEdit_ConnectLog->clear();
        memset((void*)pid,0,10);
        memset((void*)authid,0,10);
        memset((void*)scriptName,0,10);
        str = ui->m_textEdit_PID->toPlainText();
         ba = str.toLatin1();
        pbuf = ba.data();
        memcpy(pid,pbuf,ba.length());

        str = ui->m_textEdit_AuthID->toPlainText();
         ba = str.toLatin1();
        pbuf = ba.data();
        memcpy(authid,pbuf,ba.length());

        str = ui->m_textEdit_ScriptID->toPlainText();
         ba = str.toLatin1();
        pbuf = ba.data();
        memcpy(scriptName,pbuf,ba.length());

        qDebug("*%s#%s#%s*",pid,authid,scriptName);
        str = str1.sprintf("*%s#%s#%s*",pid,authid,scriptName);
        ba = str.toLatin1();
        memset((void*)accessID,0,32);
        memcpy((void*)accessID,ba.data(),ba.length());
        qDebug("=%s\r\n",accessID);
        pcmd[7] = &accessID[0];
        ui->pushButton_Connect->setText("连  接");
    }
    else{
        ui->pushButton_Connect->setText("关  闭");
    }
}

void MainWindow::on_pushButton_Relay1_clicked()
{
    int tmp;
    m_relay1_state = 1 - m_relay1_state;
    if(m_relay1_state){
        ui->m_label_Relay1_pic->setPixmap(QPixmap("./relay_on.jpg"));
        tmp = 1;
        ioctl(relay_fd, IOCTRL_CMD_RELAY_1, &tmp);
    }
    else{
        ui->m_label_Relay1_pic->setPixmap(QPixmap("./relay_off.jpg"));
        tmp = 0;
        ioctl(relay_fd, IOCTRL_CMD_RELAY_1, &tmp);
    }
    qDebug("relay1=%d\r\n",m_relay1_state);
}

void MainWindow::on_pushButton_Relay2_clicked()
{
    int tmp;
    m_relay2_state = 1 - m_relay2_state;
    if(m_relay2_state){
        ui->m_label_Relay2_pic->setPixmap(QPixmap("./relay_on.jpg"));
        tmp = 1;
        ioctl(relay_fd, IOCTRL_CMD_RELAY_2, &tmp);
    }
    else{
        ui->m_label_Relay2_pic->setPixmap(QPixmap("./relay_off.jpg"));
        tmp = 0;
        ioctl(relay_fd, IOCTRL_CMD_RELAY_2, &tmp);
    }
    qDebug("relay2=%d\r\n",m_relay2_state);
}

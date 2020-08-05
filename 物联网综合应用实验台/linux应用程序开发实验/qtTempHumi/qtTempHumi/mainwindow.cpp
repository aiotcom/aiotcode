#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QDebug>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    sht20_fd = ::open("/dev/sht20",O_RDWR|O_NONBLOCK);
    if(sht20_fd>0)
    {
        qDebug() << tr("open /dev/sht20 ok\r\n");
    }
    else
    {
        qDebug() << tr("open /dev/sht20 failure\r\n");
    }
    this->InitTimer();
    ui->processBar_Temp->setFormat(tr("温度(度): %1").arg(QString::number(0.0, 'f', 1)));
    ui->processBar_Humi->setFormat(tr("湿度(RH): %1").arg(QString::number(0.0, 'f', 1)));
    sensorState = UPDATE_TEMP;
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::InitTimer()
{
   if(NULL == m_timer)
       m_timer = new QTimer;
   //设置定时器是否为单次触发。默认为 false 多次触发
   m_timer->setSingleShot(false);
   //启动或重启定时器, 并设置定时器时间：毫秒
   m_timer->start(1000);
   //定时器触发信号槽
   connect(m_timer, SIGNAL(timeout()), this, SLOT(TimerTimeOut()));
   qDebug() << tr("timer init\r\n");

   update();
}

void MainWindow::TimerTimeOut()
{
    int key_value=0;
    float temp = 0,humi = 0;
    int contrl = 12;

    if(this->sensorState == UPDATE_TEMP){
        ::ioctl(sht20_fd, IOCTRL_CMD_READ_TEMP, &contrl);
        /*能够读取到数据*/
        if(::read(sht20_fd, (void*)&key_value, sizeof(key_value)))
        {
            temp = ((key_value) * 0.00268127) - 46.85;  //转换所得到的数据
            contrl = temp;
            ::ioctl(sht20_fd, /*IOCTRL_CMD_SHOW_TEMP*/1074031364, &contrl);
            //qDebug("temp=%d",temp);
        }
        sensorState = UPDATE_HUMI;
        ui->processBar_Temp->setValue(temp);
        ui->processBar_Temp->setTextVisible(true);
        ui->processBar_Temp->setFormat(tr("温度(摄氏度): %1").arg(QString::number(temp, 'f', 1)));
    }
    else if(this->sensorState == UPDATE_HUMI){
        ::ioctl(sht20_fd, IOCTRL_CMD_READ_HUMI, &contrl);
        if(::read(sht20_fd, (void*)&key_value, sizeof(key_value)))
        {
            humi = ((float)key_value * 0.00190735) - 6;  //转换所得到的数据
            contrl = humi;
            ::ioctl(sht20_fd, IOCTRL_CMD_SHOW_HUMI, &contrl);
        }
        sensorState = UPDATE_TEMP;
        ui->processBar_Humi->setValue(humi);
        ui->processBar_Humi->setTextVisible(true);
        ui->processBar_Humi->setFormat(tr("湿度(RH): %1").arg(QString::number(humi, 'f', 1)));
    }

    //判断定时器是否运行
    if(m_timer->isActive())
    {

        //m_timer->stop();   //停止定时器
    }
    //qDebug() << tr("timer timeout\r\n");
    //执行定时器触发时需要处理的业务
}

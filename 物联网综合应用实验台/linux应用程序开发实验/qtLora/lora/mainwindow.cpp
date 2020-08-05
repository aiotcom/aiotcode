#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    fd = ::open("/dev/sx1278",O_RDWR);
    if(fd>0){
        qDebug() << tr("open /dev/sx1278 ok\r\n");
    }
    else{
        qDebug() << tr("open /dev/sx1278 failure\r\n");
    }
    LORA_Init(fd);
    m_timer = new QTimer;
    this->InitTimer();
    ui->m_textEdit_Receive->clear();
    ui->m_textEdit_Receive->clear();
}

MainWindow::~MainWindow()
{
    delete ui;
}
void MainWindow::InitTimer()
{
    qDebug() << tr("timer init start\r\n");

   //设置定时器是否为单次触发。默认为 false 多次触发
   m_timer->setSingleShot(false);
   //启动或重启定时器, 并设置定时器时间：毫秒
   m_timer->start(500);
   //定时器触发信号槽
   connect(m_timer, SIGNAL(timeout()), this, SLOT(TimerTimeOut()));
   qDebug() << tr("timer init\r\n");
}

void MainWindow::TimerTimeOut()
{
    IRQ_RegValue = SX1276ReadBuffer( REG_LR_IRQFLAGS );
    if((IRQ_RegValue)&&(IRQ_RegValue != 0XFF))//读 LORA中断寄存器 REG_LR_IRQFLAGS，判断是否有中断发生
    {
        memset(LoraRecvBuffer,0,256);
        if(INT_FLG_RX_DONE == SX1278_InteruptHandler(LoraRecvBuffer))
        {//是接收中断，将接收的数据保存到LoraRecvBuffer中
            qDebug("get=%s\r\n",LoraRecvBuffer);
            if(strstr((const char*)LoraRecvBuffer,(const char*)"toggle led"))
            {
                //qDebug("get data\r\n");
                QString str = ui->m_textEdit_Receive->toPlainText();
                QString str2;
                str+=str2.sprintf("%s",LoraRecvBuffer);
                ui->m_textEdit_Receive->clear();
                ui->m_textEdit_Receive->append(str);
            }
        }
    }
}
void MainWindow::on_pushButton_Send_clicked()
{
    char *pbuf;
    QString str = ui->m_textEdit_Send->toPlainText();
    QByteArray ba = str.toLatin1();
    pbuf = ba.data();
    qDebug("send=%s\r\n",pbuf);
    Sx1278SendLong((unsigned char*)pbuf,strlen((const char*)pbuf));
}

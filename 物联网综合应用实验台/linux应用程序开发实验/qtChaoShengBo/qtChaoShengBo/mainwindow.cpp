#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    fd = ::open("/dev/chao_sheng_bo",O_RDWR);
    if(fd>0){
        qDebug() << tr("open /dev/chao_sheng_bo ok\r\n");
    }
    else{
        qDebug() << tr("open /dev/chao_sheng_bo failure\r\n");
    }
    buttonStatus = 0;
    ui->m_pushButton->setText(tr("关闭"));
    m_timer = new QTimer;
    this->InitTimer();
    ui->m_comboBox_SelChannel->setCurrentIndex(0);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_m_pushButton_clicked()
{
    buttonStatus = 1 - buttonStatus;
    if(buttonStatus == 1){
        ui->m_pushButton->setText(tr("打开"));
    }
    else{
        ui->m_pushButton->setText(tr("关闭"));
    }
}
void MainWindow::InitTimer()
{
    qDebug() << tr("timer init start\r\n");

   //设置定时器是否为单次触发。默认为 false 多次触发
   m_timer->setSingleShot(false);
   //启动或重启定时器, 并设置定时器时间：毫秒
   m_timer->start(1000);
   //定时器触发信号槽
   connect(m_timer, SIGNAL(timeout()), this, SLOT(TimerTimeOut()));
   qDebug() << tr("timer init\r\n");
}

void MainWindow::TimerTimeOut()
{
    int time,distance_mm,index=0,tmp=0;

    if(buttonStatus == 0){
        //如果buttonstaus == 0,就不在更新数据
        return;
    }
    index = ui->m_comboBox_SelChannel->currentIndex();
    if(index == 0){
        ioctl(fd, IOCTRL_CMD_P3A, &tmp);
    }
    else if(index == 1){
        ioctl(fd, IOCTRL_CMD_P4A, &tmp);
        printf("index=%d\r\n",index);
    }
    else if(index == 2){
        ioctl(fd, IOCTRL_CMD_P5A, &tmp);
    }
    else if(index == 3){
        ioctl(fd, IOCTRL_CMD_P6, &tmp);
    }

    if(read(fd,(void*)&time,4)>0){
        distance_mm = (int)((time/2)*0.340);
        qDebug(":::distance=%d mm\r\n",(int)((time/2)*0.340));
        QString str = ui->m_textEdit->toPlainText();
        QString str2;
        str+=str2.sprintf("距离(mm):%d\r\n",distance_mm);
        ui->m_textEdit->clear();
        ui->m_textEdit->append(str);
    }
    else{
        QString str = ui->m_textEdit->toPlainText();
        QString str2;
        str+=str2.sprintf("探测失败\r\n");
        ui->m_textEdit->clear();
        ui->m_textEdit->append(str);
    }
}

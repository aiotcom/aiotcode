#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    optelec_switch_fd = ::open("/dev/gp1s524",O_RDWR|O_NONBLOCK);
    if(optelec_switch_fd>0){
        qDebug() << tr("open /dev/gp1s524 ok\r\n");
    }
    else{
        qDebug() << tr("open /dev/gp1s524 failure\r\n");
    }
    ui->m_label_Opte->setPixmap(QPixmap("./flame_none.jpg"));
    m_timer = new QTimer;
    this->InitTimer();
}
void MainWindow::InitTimer()
{
   if(NULL == m_timer){
       m_timer = new QTimer;
   }
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
    char signal;
    if(::read(optelec_switch_fd,&signal,1)>0){
        if(signal){//火焰传感器1 检测到火焰
            ui->m_label_Opte->setPixmap(QPixmap("./flame.jpg"));
        }
        else{//火焰传感器1 非检测到火焰
            ui->m_label_Opte->setPixmap(QPixmap("./flame_none.jpg"));
        }
    }
}

MainWindow::~MainWindow()
{
    delete ui;
}

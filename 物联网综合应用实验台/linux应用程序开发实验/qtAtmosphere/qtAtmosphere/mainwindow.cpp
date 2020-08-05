#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    atmos_fd = ::open("/dev/bme280",O_RDWR);
    if(atmos_fd>0){
        qDebug() << tr("open /dev/bme280 ok\r\n");
    }
    else{
        qDebug() << tr("open /dev/bme280 failure\r\n");
    }
    m_timer = new QTimer;
    this->InitTimer();
/*
QPalette label_palette;
label_palette.setColor(QPalette::Background, QColor(0, 0, 0));
ui->label->setAutoFillBackground(true);
ui->label->setPalette(label_palette);
*/
    /*设置初始值*/
    ui->m_lcdNumber_Press->display(0.0);
    ui->m_lcdNumber_Temp->display(0.0);
    ui->m_lcdNumber_Humi->display(0.0);
    /*设置显示色彩*/
    ui->m_lcdNumber_Humi->setStyleSheet("border: 1px solid green; color: blue; background: black;");
    ui->m_lcdNumber_Press->setStyleSheet("border: 1px solid green; color: blue; background: black;");
    ui->m_lcdNumber_Temp->setStyleSheet("border: 1px solid green; color: blue; background: black;");
    Atmosphere_Init(atmos_fd);
}

MainWindow::~MainWindow()
{
    delete ui;
}
void MainWindow::InitTimer()
{
    qDebug() << tr("timer init start\r\n");
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
    unsigned int pres_raw,temp_raw,hum_raw;
    float temp_act,press_act,hum_act;
    readData(&pres_raw,&temp_raw,&hum_raw);//从寄存器读出温度、湿度、压力

    temp_act  = (float)calibration_T(temp_raw) / 100.0;
    press_act = (float)calibration_P(pres_raw) / 100.0;
    hum_act   = (float)calibration_H(hum_raw) / 1024.0;
    qDebug("pres=%d,%d,%d\r\n",pres_raw,temp_raw,hum_raw);
    qDebug("TEMP : %fDegC\r\n",temp_act);
    qDebug("PRESS : %fhPa\r\n",press_act);
    qDebug(" HUM :%f\r\n ",hum_act);

    ui->m_lcdNumber_Press->display(press_act);
    ui->m_lcdNumber_Temp->display(temp_act);
    ui->m_lcdNumber_Humi->display(hum_act);
    //判断定时器是否运行
    if(m_timer->isActive()){
        //m_timer->stop();   //停止定时器
    }
}

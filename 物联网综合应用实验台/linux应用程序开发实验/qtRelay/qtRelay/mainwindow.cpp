#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    this->m_relay_state1 = 0;
    this->m_relay_state2 = 0;
    relay_fd = ::open("/dev/relay",O_RDWR|O_NONBLOCK);
    if(relay_fd>0){
        qDebug() << tr("open /dev/relay ok\r\n");
    }
    else{
        qDebug() << tr("open /dev/relay failure\r\n");
    }
    ui->m_label_Relay1->setPixmap(QPixmap("./relay_off.jpg"));
    ui->m_label_Relay2->setPixmap(QPixmap("./relay_off.jpg"));
}

MainWindow::~MainWindow()
{
    delete ui;
}


void MainWindow::on_pushButton_Relay1_clicked()
{
    int tmp;
    m_relay_state1 = 1 - m_relay_state1;
    if(m_relay_state1){
        ui->m_label_Relay1->setPixmap(QPixmap("./relay_on.jpg"));
        tmp = 1;
        ioctl(relay_fd, IOCTRL_CMD_RELAY_1, &tmp);
    }
    else{
        ui->m_label_Relay1->setPixmap(QPixmap("./relay_off.jpg"));
        tmp = 0;
        ioctl(relay_fd, IOCTRL_CMD_RELAY_1, &tmp);
    }
    qDebug("relay1=%d\r\n",m_relay_state1);
}

void MainWindow::on_pushButton_Relay2_clicked()
{
    int tmp;
    m_relay_state2 = 1 - m_relay_state2;
    if(m_relay_state2){
        ui->m_label_Relay2->setPixmap(QPixmap("./relay_on.jpg"));
        tmp = 1;
        ioctl(relay_fd, IOCTRL_CMD_RELAY_2, &tmp);
    }
    else{
        ui->m_label_Relay2->setPixmap(QPixmap("./relay_off.jpg"));
        tmp = 0;
        ioctl(relay_fd, IOCTRL_CMD_RELAY_2, &tmp);
    }
    qDebug("relay2=%d\r\n",m_relay_state2);
}

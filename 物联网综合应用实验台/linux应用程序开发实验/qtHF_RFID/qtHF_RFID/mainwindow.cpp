#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    fd = ::open("/dev/rc522",O_RDWR);
    if(fd>0){
        qDebug() << tr("open /dev/rc522 ok\r\n");
    }
    else{
        qDebug() << tr("open /dev/rc522 failure\r\n");
    }
    RC522_Init(fd);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_pushButton_ReadCard_clicked()
{
    unsigned char buf[5];
    qDebug("clicked\r\n");
    if(IC_Card_Search(buf)){
        qDebug("==%d,%d,%d,%d\r\n",buf[0],buf[1],buf[2],buf[3]);
        QString str = ui->m_textEdit_Receive->toPlainText();
        QString str2;
        str+=str2.sprintf("卡号(HEX):%02X,%02X,%02X,%02X\r\n",buf[0],buf[1],buf[2],buf[3]);
        ui->m_textEdit_Receive->clear();
        ui->m_textEdit_Receive->append(str);
    }
}

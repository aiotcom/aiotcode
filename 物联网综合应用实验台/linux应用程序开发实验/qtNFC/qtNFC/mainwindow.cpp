#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    fd = ::open("/dev/nfc",O_RDWR);
    if(fd>0){
        qDebug() << tr("open /dev/nfc ok\r\n");
    }
    else{
        qDebug() << tr("open /dev/nfc failure\r\n");
    }
    nfc_init(fd);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_pushButton_ReadCard_clicked()
{
    unsigned int id;
    unsigned char *cptr;
    qDebug("clicked\r\n");
    cptr = (unsigned char*)&id;
    id=readPassiveTargetID(0x00);
    if(id){
        qDebug("==%08X\r\n",id);
        QString str = ui->m_textEdit_Receive->toPlainText();
        QString str2;
        str+=str2.sprintf("卡号(HEX):%02X,%02X,%02X,%02X\r\n",cptr[0],cptr[1],cptr[2],cptr[3]);
        ui->m_textEdit_Receive->clear();
        ui->m_textEdit_Receive->append(str);
    }
}

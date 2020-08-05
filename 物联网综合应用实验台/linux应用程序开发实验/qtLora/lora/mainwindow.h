#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QTimer>
#include <QMainWindow>
#include <QProgressBar>
#include <QDebug>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <linux/ioctl.h>
#include <sys/ioctl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/select.h>
#include <sys/time.h>
#include <errno.h>



#ifdef __cplusplus
extern "C" {// 如果被C++性质的文件包含了，则需要这样声明这个函数，这样他会从C性质的文件中寻找
#include <LORA.h>
extern unsigned char Sx1278SendLong(unsigned char *RF_TRAN_P,unsigned char LEN);
extern void LORA_Init(int fd);
extern unsigned char SX1278_InteruptHandler(unsigned char *pRecv);
extern unsigned char SX1276ReadBuffer(unsigned char addr);
#endif
#ifdef __cplusplus
    int fun(); //如果是被C性质文件包含，则直接声明，不执行ifdef的内容
}
#endif

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();
private:
    int fd;
    unsigned char LoraRecvBuffer[256];
    QTimer *m_timer;
    void InitTimer();
    int IRQ_RegValue;
private slots:
    void TimerTimeOut();
private slots:
    void on_pushButton_Send_clicked();

private:
    Ui::MainWindow *ui;
};

#endif // MAINWINDOW_H

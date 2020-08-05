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
#include <QElapsedTimer>
#include "string.h"
#define RELAY_MAGIC 'k'
#define IOCTRL_CMD_RELAY_1 _IOW(RELAY_MAGIC, 1, int)
#define IOCTRL_CMD_RELAY_2 _IOW(RELAY_MAGIC, 2, int)
#define ESP8266_MAGIC 'k'
#define IOCTRL_CMD_LED _IOW(ESP8266_MAGIC, 1, int)
#define IOCTRL_CMD_RST _IOW(ESP8266_MAGIC, 2, int)
#define SHT20_MAGIC 'k'
#define IOCTRL_CMD_READ_TEMP _IOW(SHT20_MAGIC, 1, int)
#define IOCTRL_CMD_READ_HUMI _IOW(SHT20_MAGIC, 2, int)
#define IOCTRL_CMD_SHOW_HUMI _IOW(SHT20_MAGIC, 3, int)
#define IOCTRL_CMD_SHOW_TEMP _IOW(SHT20_MAGIC, 4, int)
#define UPDATE_TEMP  0
#define UPDATE_HUMI  1
#ifdef __cplusplus
extern "C" {// 如果被C++性质的文件包含了，则需要这样声明这个函数，这样他会从C性质的文件中寻找
int esp8266_open(char *Dev,int *fd,int baud);

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
    unsigned char LoraRecvBuffer[256];
    QTimer *m_timer_esp8266_Init,*m_timer_ReadSHT20,*m_timer_connect_OneNET;
    void InitTimer();
    void send_at_cmd(unsigned char* cmd,unsigned char len);
    void esp8266_send(unsigned char *buf,int len);
    int esp8266_receive(unsigned char *buf);

    unsigned char accessID[32];
    unsigned char receive_buffer[200];
    unsigned char *pcmd[10],pid[10],authid[10],scriptName[10];
    unsigned int arg_0,arg_1,connectStatus,m_relay1_state,m_relay2_state;
    QElapsedTimer t_delay;
    int sensorState,isConnectOneNET;
    int m_Temp,m_Humi;
    unsigned char receiveBuffer[32];
private slots:
    void esp8266_init(void);
    void Read_SHT20(void);
    //void TimerTimeOut();
    void on_pushButton_Connect_clicked();

    void on_pushButton_Relay1_clicked();

    void on_pushButton_Relay2_clicked();
    void connect_OneNET();
private:
    int esp8266_serial_fd,esp8266io_fd,sht20_fd,relay_fd;
    int esp8266_fd;
    Ui::MainWindow *ui;
};

#endif // MAINWINDOW_H

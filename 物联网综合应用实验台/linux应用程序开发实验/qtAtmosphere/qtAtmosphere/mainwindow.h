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
extern void Atmosphere_Init(int fd);
extern void readData(unsigned int *pPress,unsigned int *pTemp,unsigned int *pHumi);
extern unsigned int calibration_H(signed  int adc_H);
extern unsigned int calibration_P(signed  int adc_P);
extern unsigned int calibration_T(signed  int adc_T);
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
    int atmos_fd;
    QTimer *m_timer;
    void InitTimer();

private slots:
    void TimerTimeOut();
private:
    Ui::MainWindow *ui;
};

#endif // MAINWINDOW_H

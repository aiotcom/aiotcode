#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
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
extern void nfc_init(int fd);
extern unsigned int readPassiveTargetID(unsigned char cardbaudrate);
#endif
#ifdef __cplusplus
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

private slots:
    void on_pushButton_ReadCard_clicked();

private:
    int fd;
    Ui::MainWindow *ui;
};

#endif // MAINWINDOW_H

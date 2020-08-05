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

#define CHB_MAGIC 'k'
#define IOCTRL_CMD_P3A _IOW(CHB_MAGIC, 1, int)
#define IOCTRL_CMD_P4A _IOW(CHB_MAGIC, 2, int)
#define IOCTRL_CMD_P5A _IOW(CHB_MAGIC, 3, int)
#define IOCTRL_CMD_P6  _IOW(CHB_MAGIC, 4, int)
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
    QTimer *m_timer;
    void InitTimer();

private slots:
    void TimerTimeOut();
private slots:
    void on_m_pushButton_clicked();

private:
    int fd;
    int buttonStatus;
    Ui::MainWindow *ui;
};

#endif // MAINWINDOW_H

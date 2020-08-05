#ifndef MAINWINDOW_H
#define MAINWINDOW_H
#include <QTimer>
#include <QMainWindow>
#include <QProgressBar>
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

#define LED_MAGIC 'k'
#define IOCTRL_CMD_READ_TEMP _IOW(LED_MAGIC, 1, int)
#define IOCTRL_CMD_READ_HUMI _IOW(LED_MAGIC, 2, int)
#define IOCTRL_CMD_SHOW_HUMI _IOW(LED_MAGIC, 3, int)
#define IOCTRL_CMD_SHOW_TEMP _IOW(LED_MAGIC, 4, int)
#define UPDATE_TEMP  0
#define UPDATE_HUMI  1

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
    Ui::MainWindow *ui;
    int sht20_fd;
    int sensorState;
private:
    QTimer *m_timer;
    void InitTimer();

private slots:
    void TimerTimeOut();
};

#endif // MAINWINDOW_H

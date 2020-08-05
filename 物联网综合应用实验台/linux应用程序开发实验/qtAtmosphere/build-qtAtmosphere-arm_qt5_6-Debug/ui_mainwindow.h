/********************************************************************************
** Form generated from reading UI file 'mainwindow.ui'
**
** Created by: Qt User Interface Compiler version 5.6.2
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_MAINWINDOW_H
#define UI_MAINWINDOW_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLCDNumber>
#include <QtWidgets/QLabel>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QMenuBar>
#include <QtWidgets/QStatusBar>
#include <QtWidgets/QToolBar>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_MainWindow
{
public:
    QWidget *centralWidget;
    QLCDNumber *m_lcdNumber_Press;
    QLCDNumber *m_lcdNumber_Temp;
    QLCDNumber *m_lcdNumber_Humi;
    QLabel *label;
    QLabel *label_2;
    QLabel *label_3;
    QMenuBar *menuBar;
    QToolBar *mainToolBar;
    QStatusBar *statusBar;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName(QStringLiteral("MainWindow"));
        MainWindow->resize(602, 311);
        centralWidget = new QWidget(MainWindow);
        centralWidget->setObjectName(QStringLiteral("centralWidget"));
        m_lcdNumber_Press = new QLCDNumber(centralWidget);
        m_lcdNumber_Press->setObjectName(QStringLiteral("m_lcdNumber_Press"));
        m_lcdNumber_Press->setGeometry(QRect(211, 20, 180, 70));
        m_lcdNumber_Press->setSmallDecimalPoint(true);
        m_lcdNumber_Press->setDigitCount(5);
        m_lcdNumber_Temp = new QLCDNumber(centralWidget);
        m_lcdNumber_Temp->setObjectName(QStringLiteral("m_lcdNumber_Temp"));
        m_lcdNumber_Temp->setGeometry(QRect(211, 90, 180, 70));
        m_lcdNumber_Temp->setSmallDecimalPoint(true);
        m_lcdNumber_Temp->setDigitCount(5);
        m_lcdNumber_Humi = new QLCDNumber(centralWidget);
        m_lcdNumber_Humi->setObjectName(QStringLiteral("m_lcdNumber_Humi"));
        m_lcdNumber_Humi->setGeometry(QRect(211, 160, 180, 70));
        m_lcdNumber_Humi->setSmallDecimalPoint(true);
        m_lcdNumber_Humi->setDigitCount(5);
        label = new QLabel(centralWidget);
        label->setObjectName(QStringLiteral("label"));
        label->setGeometry(QRect(110, 40, 81, 31));
        QFont font;
        font.setPointSize(13);
        label->setFont(font);
        label->setScaledContents(true);
        label->setWordWrap(true);
        label_2 = new QLabel(centralWidget);
        label_2->setObjectName(QStringLiteral("label_2"));
        label_2->setGeometry(QRect(90, 120, 101, 17));
        label_2->setFont(font);
        label_3 = new QLabel(centralWidget);
        label_3->setObjectName(QStringLiteral("label_3"));
        label_3->setGeometry(QRect(110, 190, 67, 17));
        label_3->setFont(font);
        MainWindow->setCentralWidget(centralWidget);
        menuBar = new QMenuBar(MainWindow);
        menuBar->setObjectName(QStringLiteral("menuBar"));
        menuBar->setGeometry(QRect(0, 0, 602, 25));
        MainWindow->setMenuBar(menuBar);
        mainToolBar = new QToolBar(MainWindow);
        mainToolBar->setObjectName(QStringLiteral("mainToolBar"));
        MainWindow->addToolBar(Qt::TopToolBarArea, mainToolBar);
        statusBar = new QStatusBar(MainWindow);
        statusBar->setObjectName(QStringLiteral("statusBar"));
        MainWindow->setStatusBar(statusBar);

        retranslateUi(MainWindow);

        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindow)
    {
        MainWindow->setWindowTitle(QApplication::translate("MainWindow", "MainWindow", 0));
        label->setText(QApplication::translate("MainWindow", "\346\260\224\345\216\213(hPa):", 0));
        label_2->setText(QApplication::translate("MainWindow", "\346\270\251\345\272\246(\346\221\204\346\260\217\345\272\246):", 0));
        label_3->setText(QApplication::translate("MainWindow", "\346\271\277\345\272\246(RH):", 0));
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H

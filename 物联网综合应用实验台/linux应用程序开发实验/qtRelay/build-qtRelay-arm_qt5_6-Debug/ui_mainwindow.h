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
#include <QtWidgets/QLabel>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QMenuBar>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QStatusBar>
#include <QtWidgets/QToolBar>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_MainWindow
{
public:
    QWidget *centralWidget;
    QPushButton *pushButton_Relay2;
    QLabel *m_label_Relay2;
    QLabel *m_label_Relay1;
    QPushButton *pushButton_Relay1;
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
        pushButton_Relay2 = new QPushButton(centralWidget);
        pushButton_Relay2->setObjectName(QStringLiteral("pushButton_Relay2"));
        pushButton_Relay2->setGeometry(QRect(330, 160, 99, 27));
        m_label_Relay2 = new QLabel(centralWidget);
        m_label_Relay2->setObjectName(QStringLiteral("m_label_Relay2"));
        m_label_Relay2->setGeometry(QRect(330, 50, 90, 90));
        m_label_Relay1 = new QLabel(centralWidget);
        m_label_Relay1->setObjectName(QStringLiteral("m_label_Relay1"));
        m_label_Relay1->setGeometry(QRect(160, 50, 90, 90));
        pushButton_Relay1 = new QPushButton(centralWidget);
        pushButton_Relay1->setObjectName(QStringLiteral("pushButton_Relay1"));
        pushButton_Relay1->setGeometry(QRect(160, 160, 99, 27));
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
        pushButton_Relay2->setText(QApplication::translate("MainWindow", "\347\273\247\347\224\265\345\231\2502", 0));
        m_label_Relay2->setText(QApplication::translate("MainWindow", "TextLabel", 0));
        m_label_Relay1->setText(QApplication::translate("MainWindow", "adsa", 0));
        pushButton_Relay1->setText(QApplication::translate("MainWindow", "\347\273\247\347\224\265\345\231\2501", 0));
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H

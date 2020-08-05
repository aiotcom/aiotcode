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
#include <QtWidgets/QGridLayout>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLCDNumber>
#include <QtWidgets/QLabel>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QTextEdit>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_MainWindow
{
public:
    QWidget *centralWidget;
    QGridLayout *gridLayout_2;
    QHBoxLayout *horizontalLayout;
    QVBoxLayout *verticalLayout_5;
    QLabel *label;
    QTextEdit *m_textEdit_ConnectLog;
    QVBoxLayout *verticalLayout;
    QLabel *label_2;
    QTextEdit *m_textEdit_PID;
    QLabel *label_3;
    QTextEdit *m_textEdit_AuthID;
    QLabel *label_4;
    QTextEdit *m_textEdit_ScriptID;
    QPushButton *pushButton_Connect;
    QVBoxLayout *verticalLayout_2;
    QVBoxLayout *verticalLayout_7;
    QLabel *label_5;
    QLCDNumber *m_lcdNumber_Temp;
    QLabel *label_6;
    QLCDNumber *m_lcdNumber_Humi;
    QHBoxLayout *horizontalLayout_4;
    QLabel *m_label_Relay1_pic;
    QLabel *m_label_Relay2_pic;
    QHBoxLayout *horizontalLayout_3;
    QPushButton *pushButton_Relay1;
    QPushButton *pushButton_Relay2;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName(QStringLiteral("MainWindow"));
        MainWindow->resize(602, 311);
        centralWidget = new QWidget(MainWindow);
        centralWidget->setObjectName(QStringLiteral("centralWidget"));
        gridLayout_2 = new QGridLayout(centralWidget);
        gridLayout_2->setSpacing(6);
        gridLayout_2->setContentsMargins(11, 11, 11, 11);
        gridLayout_2->setObjectName(QStringLiteral("gridLayout_2"));
        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setSpacing(6);
        horizontalLayout->setObjectName(QStringLiteral("horizontalLayout"));
        horizontalLayout->setContentsMargins(10, -1, 10, -1);
        verticalLayout_5 = new QVBoxLayout();
        verticalLayout_5->setSpacing(6);
        verticalLayout_5->setObjectName(QStringLiteral("verticalLayout_5"));
        verticalLayout_5->setContentsMargins(-1, 10, -1, 10);
        label = new QLabel(centralWidget);
        label->setObjectName(QStringLiteral("label"));
        QFont font;
        font.setPointSize(13);
        label->setFont(font);

        verticalLayout_5->addWidget(label);

        m_textEdit_ConnectLog = new QTextEdit(centralWidget);
        m_textEdit_ConnectLog->setObjectName(QStringLiteral("m_textEdit_ConnectLog"));

        verticalLayout_5->addWidget(m_textEdit_ConnectLog);


        horizontalLayout->addLayout(verticalLayout_5);

        verticalLayout = new QVBoxLayout();
        verticalLayout->setSpacing(6);
        verticalLayout->setObjectName(QStringLiteral("verticalLayout"));
        verticalLayout->setContentsMargins(0, 20, -1, 20);
        label_2 = new QLabel(centralWidget);
        label_2->setObjectName(QStringLiteral("label_2"));
        label_2->setFont(font);

        verticalLayout->addWidget(label_2);

        m_textEdit_PID = new QTextEdit(centralWidget);
        m_textEdit_PID->setObjectName(QStringLiteral("m_textEdit_PID"));

        verticalLayout->addWidget(m_textEdit_PID);

        label_3 = new QLabel(centralWidget);
        label_3->setObjectName(QStringLiteral("label_3"));
        label_3->setFont(font);

        verticalLayout->addWidget(label_3);

        m_textEdit_AuthID = new QTextEdit(centralWidget);
        m_textEdit_AuthID->setObjectName(QStringLiteral("m_textEdit_AuthID"));

        verticalLayout->addWidget(m_textEdit_AuthID);

        label_4 = new QLabel(centralWidget);
        label_4->setObjectName(QStringLiteral("label_4"));
        label_4->setFont(font);

        verticalLayout->addWidget(label_4);

        m_textEdit_ScriptID = new QTextEdit(centralWidget);
        m_textEdit_ScriptID->setObjectName(QStringLiteral("m_textEdit_ScriptID"));

        verticalLayout->addWidget(m_textEdit_ScriptID);

        pushButton_Connect = new QPushButton(centralWidget);
        pushButton_Connect->setObjectName(QStringLiteral("pushButton_Connect"));

        verticalLayout->addWidget(pushButton_Connect);


        horizontalLayout->addLayout(verticalLayout);

        verticalLayout_2 = new QVBoxLayout();
        verticalLayout_2->setSpacing(6);
        verticalLayout_2->setObjectName(QStringLiteral("verticalLayout_2"));
        verticalLayout_2->setContentsMargins(10, 10, 10, -1);
        verticalLayout_7 = new QVBoxLayout();
        verticalLayout_7->setSpacing(6);
        verticalLayout_7->setObjectName(QStringLiteral("verticalLayout_7"));
        verticalLayout_7->setContentsMargins(-1, -1, 60, -1);
        label_5 = new QLabel(centralWidget);
        label_5->setObjectName(QStringLiteral("label_5"));

        verticalLayout_7->addWidget(label_5);

        m_lcdNumber_Temp = new QLCDNumber(centralWidget);
        m_lcdNumber_Temp->setObjectName(QStringLiteral("m_lcdNumber_Temp"));

        verticalLayout_7->addWidget(m_lcdNumber_Temp);

        label_6 = new QLabel(centralWidget);
        label_6->setObjectName(QStringLiteral("label_6"));

        verticalLayout_7->addWidget(label_6);

        m_lcdNumber_Humi = new QLCDNumber(centralWidget);
        m_lcdNumber_Humi->setObjectName(QStringLiteral("m_lcdNumber_Humi"));

        verticalLayout_7->addWidget(m_lcdNumber_Humi);


        verticalLayout_2->addLayout(verticalLayout_7);

        horizontalLayout_4 = new QHBoxLayout();
        horizontalLayout_4->setSpacing(6);
        horizontalLayout_4->setObjectName(QStringLiteral("horizontalLayout_4"));
        m_label_Relay1_pic = new QLabel(centralWidget);
        m_label_Relay1_pic->setObjectName(QStringLiteral("m_label_Relay1_pic"));

        horizontalLayout_4->addWidget(m_label_Relay1_pic);

        m_label_Relay2_pic = new QLabel(centralWidget);
        m_label_Relay2_pic->setObjectName(QStringLiteral("m_label_Relay2_pic"));

        horizontalLayout_4->addWidget(m_label_Relay2_pic);


        verticalLayout_2->addLayout(horizontalLayout_4);

        horizontalLayout_3 = new QHBoxLayout();
        horizontalLayout_3->setSpacing(6);
        horizontalLayout_3->setObjectName(QStringLiteral("horizontalLayout_3"));
        horizontalLayout_3->setContentsMargins(10, -1, 10, -1);
        pushButton_Relay1 = new QPushButton(centralWidget);
        pushButton_Relay1->setObjectName(QStringLiteral("pushButton_Relay1"));

        horizontalLayout_3->addWidget(pushButton_Relay1);

        pushButton_Relay2 = new QPushButton(centralWidget);
        pushButton_Relay2->setObjectName(QStringLiteral("pushButton_Relay2"));

        horizontalLayout_3->addWidget(pushButton_Relay2);


        verticalLayout_2->addLayout(horizontalLayout_3);


        horizontalLayout->addLayout(verticalLayout_2);

        horizontalLayout->setStretch(0, 2);
        horizontalLayout->setStretch(1, 1);
        horizontalLayout->setStretch(2, 2);

        gridLayout_2->addLayout(horizontalLayout, 0, 0, 1, 1);

        MainWindow->setCentralWidget(centralWidget);

        retranslateUi(MainWindow);

        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindow)
    {
        MainWindow->setWindowTitle(QApplication::translate("MainWindow", "MainWindow", 0));
        label->setText(QApplication::translate("MainWindow", "\350\277\236\346\216\245\346\227\245\345\277\227\357\274\232", 0));
        label_2->setText(QApplication::translate("MainWindow", "\344\272\247\345\223\201ID:", 0));
        label_3->setText(QApplication::translate("MainWindow", "\351\211\264\346\235\203\344\277\241\346\201\257", 0));
        label_4->setText(QApplication::translate("MainWindow", "\350\204\232\346\234\254\345\220\215\347\247\260\357\274\232", 0));
        pushButton_Connect->setText(QApplication::translate("MainWindow", "PushButton", 0));
        label_5->setText(QApplication::translate("MainWindow", "\346\270\251\345\272\246(\345\272\246)", 0));
        label_6->setText(QApplication::translate("MainWindow", "\346\271\277\345\272\246(%)", 0));
        m_label_Relay1_pic->setText(QApplication::translate("MainWindow", "TextLabel", 0));
        m_label_Relay2_pic->setText(QApplication::translate("MainWindow", "TextLabel", 0));
        pushButton_Relay1->setText(QApplication::translate("MainWindow", "\347\273\247\347\224\265\345\231\2501", 0));
        pushButton_Relay2->setText(QApplication::translate("MainWindow", "\347\273\247\347\224\265\345\231\2502", 0));
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H

#-------------------------------------------------
#
# Project created by QtCreator 2020-04-17T01:45:25
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = qtNFC
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp \
    NFC.c \
    PN532.c

HEADERS  += mainwindow.h \
    NFC.h \
    PN532.h

FORMS    += mainwindow.ui

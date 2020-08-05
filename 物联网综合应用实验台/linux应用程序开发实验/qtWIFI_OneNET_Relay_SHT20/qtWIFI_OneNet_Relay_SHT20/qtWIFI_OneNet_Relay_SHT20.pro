#-------------------------------------------------
#
# Project created by QtCreator 2020-04-20T18:55:48
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = qtWIFI_OneNet_Relay_SHT20
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp \
    esp8266.c

HEADERS  += mainwindow.h

FORMS    += mainwindow.ui

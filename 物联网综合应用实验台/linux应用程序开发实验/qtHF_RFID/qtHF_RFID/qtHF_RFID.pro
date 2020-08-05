#-------------------------------------------------
#
# Project created by QtCreator 2020-04-16T21:08:19
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = qtHF_RFID
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp \
    RC522.c

HEADERS  += mainwindow.h

FORMS    += mainwindow.ui

#-------------------------------------------------
#
# Project created by QtCreator 2020-04-20T01:25:04
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = lora
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp \
    LORA.c

HEADERS  += mainwindow.h \
    LORA.h

FORMS    += mainwindow.ui

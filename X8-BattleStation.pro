TEMPLATE = app

QT += core qml quick

SOURCES += main.cpp \
    mainthread.cpp \
    input/inputHandler.cpp


RESOURCES += qml.qrc

CONFIG += c++11

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    mainthread.h \
    input/inputHandler.h

win32 {
    INCLUDEPATH += $$PWD/input/SDL/include
    DEPENDPATH += $$PWD/input/SDL/include

    !contains(QMAKE_TARGET.arch, x86_64) {
        #x86 / 32-bit Windows define
        LIBS += -L$$PWD/input/SDL/lib/x86/ -lSDL2
    } else {
        #x86_64 / 64-bit Window define
        LIBS += -L$$PWD/input/SDL/lib/x64/ -lSDL2
    }
}

linux-g++ {
    LIBS += -L$$PWD/input/SDL/lib/x64/ -lSDL2
    INCLUDEPATH += $$PWD/input/SDL/include
    DEPENDPATH += $$PWD/input/SDL/include
}

macx {
    INCLUDEPATH += $$PWD/input/SDL/include
    INCLUDEPATH += -F/Library/Frameworks
    QMAKE_LFLAGS += -F/Library/Frameworks/ -framework SDL2
}

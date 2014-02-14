# Add more folders to ship with the application, here
folder_01.source = qml/QingfengCalendar
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    Database/CalendarContract.cpp \
    Database/CalendarInstancesHelper.cpp \
    Database/Database.cpp \
    Database/Event.cpp \
    Database/EventRecurrence.cpp \
    Database/RecurrenceProcessor.cpp \
    CalendarComponents/Calendar.cpp \
    CalendarComponents/DaysModel.cpp

# Installation path
# target.path =

# Please do not modify the following two lines. Required for deployment.
include(qtquick2applicationviewer/qtquick2applicationviewer.pri)
qtcAddDeployment()

HEADERS += \
    Database/CalendarContract.h \
    Database/CalendarInstancesHelper.h \
    Database/Database.h \
    Database/Event.h \
    Database/EventRecurrence.h \
    Database/RecurrenceProcessor.h \
    CalendarComponents/Calendar.h \
    CalendarComponents/DayData.h \
    CalendarComponents/DaysModel.h

RESOURCES += \
    resources/Calendar.qrc

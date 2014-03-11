import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import QtQuick.Window 2.1
import QtOrganizer 5.0
import MyCalendar.Utils.Events 1.0

Window {
    visible: true
    width: 960
    height: 600

    minimumHeight: 560
    minimumWidth: 800

    title: "Qingfeng Calendar"

    id: main_window

    StackView {
        id: stack_view
        anchors.fill: parent
        focus: true

        delegate: stack_view_delegate

        initialItem: MyCalendar {
            id: calendar
            objectName: "calendar"
            //            width: parent.width * 0.6 - row.spacing / 2
            width: parent.width
            height: parent.height
            selectedDate: new Date()
            focus: true
        }
    }

    EventEditView {
        id: event_edit_view
        visible: false
    }

    StackViewDelegate {
        id: stack_view_delegate

        property bool horizontal : true

        function getTransition(properties)
        {
            return stack_view_delegate["horizontalSlide"][properties.name]
        }

        function transitionFinished(properties)
        {
            properties.exitItem.x = 0
            properties.exitItem.y = 0
        }

        property QtObject horizontalSlide: QtObject {
            property Component pushTransition: StackViewTransition {
                PropertyAnimation {
                    target: enterItem
                    property: "x"
                    from: target.width
                    to: 0
                    duration: 200
                }
                PropertyAnimation {
                    target: exitItem
//                    property: "x"
//                    from: 0
//                    to: -target.width
//                    duration: 100
                    property: "opacity"
                    from: 1
                    to: 0
                    duration: 200
                }
            }

            property Component popTransition: StackViewTransition {
                PropertyAnimation {
                    target: enterItem
//                    property: "x"
//                    from: -target.width
//                    to: 0
//                    duration: 200
                    property: "opacity"
                    from: 0
                    to: 1
                    duration: 200
                }
                PropertyAnimation {
                    target: exitItem
                    property: "x"
                    from: 0
                    to: target.width
                    duration: 200
                }
            }
            property Component replaceTransition: pushTransition
        }
    }

    Component.onCompleted: {
        console.log("The last");
    }
}

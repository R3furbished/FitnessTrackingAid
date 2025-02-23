import QtQuick 2.15
import QtQuick.Layouts

Rectangle {
    color: "green"
    radius: 5

    Rectangle {
        //This rectangle will be replaced by an icon
        //It will have a clickable action;
        id: toggleSideBarButton
        width: 25
        height: 25
        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
            margins: 10
        }
        color: "pink"
        radius: 5
    }

    RowLayout {
        //Row container for the buttons
        //It will contain icons with clickable areas with
        //the options for DietView;
        height: parent.height
        width: parent.width / 3
        anchors {
            right: parent.right
        }
        spacing: 0

        Rectangle {
            id: button1
            color: "blue"
            border.color: "black"
            width: parent.width / 3
            height: 35
            radius: 5
        }

        Rectangle {
            id: button2
            color: "blue"
            border.color: "black"
            width: parent.width / 3
            height: 35
            radius: 5
        }
        Rectangle {
            id: button3
            color: "blue"
            border.color: "black"
            width: parent.width / 3
            height: 35
            radius: 5
        }
    }
}

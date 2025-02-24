import QtQuick 2.15
import QtQuick.Controls

Item {

    Rectangle {
        id: bottomBar
        height: 40
        width: parent.width
        anchors.bottom: parent.bottom
        color: "black"

        Button {
            width: 80
            anchors.verticalCenter: bottomBar.verticalCenter
            anchors.left: bottomBar.left
            text: "food"
            // onClicked: {
            //     foody.open()
            // }
        }
        Button {
            width: 80
            anchors.centerIn: parent
            anchors.verticalCenter: bottomBar.verticalCenter
            text: "macros"
        }
        Button {
            width: 80
            anchors.verticalCenter: bottomBar.verticalCenter
            anchors.right: bottomBar.right
            text: "stats"
        }
    }
}

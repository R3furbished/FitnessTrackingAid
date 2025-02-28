import QtQuick 2.15
import QtQuick.Controls
import "../MyDialogs"

//Missing -> C++ data interaction and displaying the model
Page {

    Rectangle {
        id: backgroundRectangle
        anchors.fill: parent
        height: parent.height
        width: parent.width
        color: "#22092C"
    }

    Rectangle {
        id: macroPlacement
        width: mealListPlacement.width
        height: 50
        radius: 10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 10
        color: "gray"
        Text {
            anchors.centerIn: parent
            text: new Date().toLocaleDateString(Qt.locale().shortFormat)
            font.bold: true
        }
    }

    Rectangle {
        id: mealListPlacement
        anchors.top: macroPlacement.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width - 70
        height: parent.height - 200
        color: "#872341"
    }

    Rectangle {
        id: addFoddButton
        anchors.top: mealListPlacement.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        height: 60
        width: 60
        radius: 30
        color: "#872341"
        MouseArea {
            anchors.fill: parent
            onClicked: {
                addMealDialog.open()
            }
        }
    }

    CreateMealDialog {
        id: addMealDialog
    }
}

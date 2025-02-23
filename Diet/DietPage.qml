import QtQuick 2.15
import QtQuick.Controls

Page {
    Rectangle {
        id: backgroundRectangle
        anchors.fill: parent
        height: parent.height
        width: parent.width
        color: "#22092C"
    }

    Rectangle {
        anchors.centerIn: parent
        width: 200
        height: 200
        color: "#872341"
    }

    footer: TabBar {
        id: dietPageToolBar
        // Add Food | Add Meal | Save Day
    }
}

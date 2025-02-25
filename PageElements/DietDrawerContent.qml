import QtQuick 2.15

Rectangle {
    width: parent.width
    height: 20
    color: "#22092C"

    Rectangle {
        width: parent.width
        height: 30
        anchors.top: parent.top
        anchors.topMargin: 10
        color: "#872341"
        radius: 10
        Text {
            anchors.centerIn: parent
            text: "History"
            font.bold: true
            font.pixelSize: 20
        }
    }
}

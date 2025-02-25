import QtQuick 2.15
import QtQuick.Controls

Page {

    Rectangle {
        id: backgroundRect
        anchors.fill: parent
        color: "green"
        Text {
            anchors.centerIn: parent
            text: "STATS PAGE"
            font.bold: true
            font.pixelSize: 70
        }
    }
}

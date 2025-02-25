import QtQuick 2.15
import QtQuick.Controls

Page {

    Rectangle {
        id: backgroundRect
        anchors.fill: parent
        color: "red"
        Text {
            anchors.centerIn: parent
            text: "MACROS PAGE"
            font.bold: true
            font.pixelSize: 70
        }
    }
}

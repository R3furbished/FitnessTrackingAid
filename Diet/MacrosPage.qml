import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts

Page {

    Rectangle {
        id: backgroundRectangle
        anchors.fill: parent
        height: parent.height
        width: parent.width
        color: "#22092C"
    }

    Rectangle {
        id: topRect
        width: parent.width - 20
        height: 140
        radius: 10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 10
        color: "lightgreen"

        Rectangle {
            id: heightInputRect
            anchors.top: topRect.top
            anchors.topMargin: 10
            anchors.right: topRect.right
            anchors.rightMargin: 10
            height: 35
            width: 130
            radius: 10
            color: "gray"

            TextField {
                id: heightText
                width: 100
                anchors.left: parent.left
                anchors.leftMargin: 5
                anchors.verticalCenter: parent.verticalCenter
                placeholderText: "Height"
                font.bold: true
            }

            Label {
                anchors.right: parent.right
                anchors.rightMargin: 5
                anchors.verticalCenter: parent.verticalCenter
                text: "cm"
                font.bold: true
            }
        }
        Rectangle {
            id: weightInputRect
            anchors.top: heightInputRect.bottom
            anchors.topMargin: 10
            anchors.right: topRect.right
            anchors.rightMargin: 10
            height: 35
            width: 130
            radius: 10
            color: "gray"
            TextField {
                id: weightText
                width: 100
                anchors.left: parent.left
                anchors.leftMargin: 5
                anchors.verticalCenter: parent.verticalCenter
                placeholderText: "Weight"
                font.bold: true
            }

            Label {
                anchors.right: parent.right
                anchors.rightMargin: 5
                anchors.verticalCenter: parent.verticalCenter
                text: "Kg"
                font.bold: true
            }
        }
        Rectangle {
            id: ageInputRect
            anchors.top: weightInputRect.bottom
            anchors.topMargin: 10
            anchors.right: topRect.right
            anchors.rightMargin: 10
            height: 35
            width: 130
            radius: 10
            color: "gray"
            TextField {
                id: ageText
                width: 100
                anchors.left: parent.left
                anchors.leftMargin: 5
                anchors.verticalCenter: parent.verticalCenter
                placeholderText: "Age"
                font.bold: true
            }

            Label {
                anchors.right: parent.right
                anchors.rightMargin: 5
                anchors.verticalCenter: parent.verticalCenter
                text: "age"
                font.bold: true
            }
        }
        Rectangle {
            id: genderInputRect
            anchors.top: activeLvLInputRect.bottom
            anchors.topMargin: 10
            anchors.left: topRect.left
            anchors.leftMargin: 10
            height: 35
            width: 130
            radius: 10
            color: "gray"
            TextField {
                id: genderText
                width: 100
                anchors.left: parent.left
                anchors.leftMargin: 5
                anchors.verticalCenter: parent.verticalCenter
                placeholderText: "Gender"
                font.bold: true
            }

            Label {
                anchors.right: parent.right
                anchors.rightMargin: 5
                anchors.verticalCenter: parent.verticalCenter
                text: "M/F"
                font.bold: true
            }
        }
        Rectangle {
            id: activeLvLInputRect
            anchors.top: topRect.top
            anchors.topMargin: 10
            anchors.left: topRect.left
            anchors.leftMargin: 10
            height: 35
            width: 130
            radius: 10
            color: "gray"
            TextField {
                id: activityText
                width: 100
                anchors.left: parent.left
                anchors.leftMargin: 5
                anchors.verticalCenter: parent.verticalCenter
                placeholderText: "ActivityLevel"
                font.bold: true
            }

            Label {
                anchors.right: parent.right
                anchors.rightMargin: 5
                anchors.verticalCenter: parent.verticalCenter
                text: "0-5"
                font.bold: true
            }
        }
    }
}

import QtQuick 2.15
import QtQuick.Controls
import "../MyDialogs"

//Missing   -> Deciding the layout and coding it
//			-> C++ data interaction and displaying the model
Page {
    id: foodsPage
    Rectangle {
        id: backgroundRect
        anchors.fill: parent
        color: "#22092C"
    }

    Rectangle {
        id: foodListPlacement
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 20
        height: parent.height - 140
        width: parent.width - 70
        radius: 5
        color: "#BE3144"

        ListView {
            id: foodListView
            anchors.fill: parent
            model: foodModel
            delegate: foodItemDelegate
            currentIndex: -1
            Component.onCompleted: console.log(
                                       "ListView index: " + foodListView.currentIndex)
        }
    }

    Component {
        id: foodItemDelegate
        Rectangle {
            width: parent.width
            height: 35
            color: "gray"
            border.color: "black"

            radius: 10
            Text {
                id: textID
                anchors.centerIn: parent
                font.pixelSize: 20
                font.bold: true
                text: "" + name + " " + calories + " " + grams_value
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    foodListView.currentIndex = index
                    console.log(foodListView.currentIndex)
                    console.log(foodListView.currentItem)
                    if (editFoodDialogLoader.active === true) {
                        editFoodDialogLoader.active = false
                    }

                    editFoodDialogLoader.active = true
                    editFoodDialogLoader.item.open()
                }
            }
        }
    }

    Rectangle {
        id: addFoddButton
        anchors.top: foodListPlacement.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        height: 60
        width: 60
        radius: 30
        color: "#872341"
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (createFoodDialogLoader.active === true) {
                    createFoodDialogLoader.active = false
                }

                createFoodDialogLoader.active = true
                createFoodDialogLoader.item.open()
            }
        }
    }
    Loader {
        id: createFoodDialogLoader
        anchors.fill: parent
        sourceComponent: CreateFoodDialog {
            id: addFoodDialog
        }
    }
    Loader {
        id: editFoodDialogLoader
        anchors.fill: parent
        sourceComponent: EditFoodDialog {
            id: editFoodDialog
        }
    }
    Component.onDestruction: console.log("Deleted FOOD page.")
}

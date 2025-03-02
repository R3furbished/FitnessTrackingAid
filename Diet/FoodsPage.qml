import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
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

    // Rectangle {
    //     id: macrosTextInfo
    //     width: foodListPlacement.width
    //     color: "gray"
    //     radius: 10
    //     height: 50
    //     anchors.top: parent.top
    //     anchors.topMargin: 10
    //     anchors.horizontalCenter: parent.horizontalCenter
    //     RowLayout {
    //         id: macrosRow
    //         anchors.fill: parent
    //         Label {
    //             id: foodName
    //             text: "Name:"
    //             font.bold: true
    //         }
    //         Label {
    //             id: kcal
    //             text: "Kcal:"
    //             font.bold: true
    //         }
    //         Label {
    //             id: grams
    //             text: "G:"
    //             font.bold: true
    //         }
    //         Label {
    //             id: prot
    //             text: "Prot:"
    //             font.bold: true
    //         }
    //         Label {
    //             id: fat
    //             text: "Fats:"
    //             font.bold: true
    //         }
    //         Label {
    //             id: carb
    //             text: "Carbs:"
    //             font.bold: true
    //         }
    //     }
    // }
    Rectangle {
        id: foodListPlacement
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        //anchors.top: macrosTextInfo.bottom
        anchors.topMargin: 20
        height: parent.height - 190
        width: parent.width - 70
        radius: 5
        color: "#BE3144"

        ListView {
            id: foodListView
            anchors.fill: parent
            model: foodModel
            delegate: foodItemDelegate
            currentIndex: -1
        }
    }

    Component {
        id: foodItemDelegate
        Rectangle {
            width: parent.width
            height: 40
            color: "gray"
            border.color: "black"

            radius: 10

            // @ImproveDeleagteUI
            // This RowLayout should contain:
            //	FoodNAme | value "Kcal" | value "Prot" | value "Carbs" | value "Fats| value "Grams"
            Text {
                text: name
                font.pixelSize: 20
                font.bold: true
                anchors.centerIn: parent
            }

            // Text {
            //     id: textID
            //     anchors.centerIn: parent
            //     font.bold: true
            //     text: name + " | " + grams_value + " | " + calories + " | "
            //           + proteins + " | " + fats + " | " + carbs
            // }
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
                //Setting active to true and false to force the Loader to uncache the Dialog.
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

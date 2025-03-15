import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Dialogs

Dialog {
    id: mealFormDialog
    height: parent.height * 2 / 3
    width: parent.width - 20
    anchors.centerIn: parent
    modal: true
    focus: true

    Rectangle {
        id: macrosDisplay
        width: parent.width
        color: "lightblue"
        radius: 10
        height: 60
    }

    ListView {
        id: foodListView
        anchors.top: macrosDisplay.bottom
        anchors.topMargin: 10
        height: parent.height / 2
        width: parent.width
        clip: true
        model: foodManagerModel.foods
        delegate: ItemDelegate {
            id: foodItemDelegate
            width: parent.width
            height: 40

            required property int index

            onClicked: foodListView.currentIndex = index

            Loader {
                //TODO:: trying to create a selectable delegate variant
                // When item is selected should request for grams and add it to
                // the meal if the grams field is not empty;
                id: nonActivefoodLoader
                anchors.fill: parent
                sourceComponent: Rectangle {
                    id: recting
                    radius: 10
                    color: "gray"
                    border.color: "black"
                    anchors.fill: parent
                    Text {
                        id: foodName
                        text: foodManagerModel.foods[index].name
                        font.pixelSize: 20
                        font.bold: true
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    TextField {
                        anchors.right: addButton.left
                        placeholderText: "grams"
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    Button {
                        id: addButton
                        height: parent.height
                        width: 70
                        anchors.right: parent.right
                        text: "ADD"
                        onClicked: {
                            console.log("add was pressed.")
                        }
                    }

                    // MouseArea {
                    //     id: mouseAreaForCollor
                    //     width: parent.width - addButton.implicitWidth
                    //     height: parent.height
                    //     onClicked: {

                    //         if (recting.color.toString() === "#808080") {
                    //             recting.color = "lightblue"
                    //         } else {
                    //             recting.color = "gray"
                    //         }
                    //     }
                    // }
                }
                active: true
            }
        }
        currentIndex: -1
    }

    Button {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        text: qsTr("Cancel")
        onClicked: {
            mealFormDialog.close()
        }
    }

    Button {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        text: qsTr("Add")
        onClicked: {
            console.log("Added meals")
        }
    }
    Button {
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        text: qsTr("Done")
    }
}

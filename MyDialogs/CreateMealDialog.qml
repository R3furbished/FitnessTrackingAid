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
        Text {
            id: macrosText
            anchors.centerIn: parent
            text: "Macro Values goes here."
            font.bold: true
        }
    }

    Rectangle {
        width: parent.width
        id: searchBar
        anchors.top: macrosDisplay.bottom
        color: "gray"
        radius: 10
        height: 30
        TextField {
            id: searchBarText
            anchors.fill: parent
            placeholderText: "Food Name"
            onEditingFinished: {
                macrosText.text = foodManagerModel.getFoodItemWithName(
                            searchBar.text).proteins
            }
        }
    }

    ListView {
        id: foodListView
        anchors.top: searchBar.bottom
        anchors.topMargin: 10
        height: parent.height / 2
        width: parent.width
        clip: true
        //TODO::getFoodItemWithName() should return a List
        model: foodManagerModel.getFoodItemWithName(searchBarText.text)
        delegate: ItemDelegate {
            id: foodItemDelegate
            width: parent.width
            height: 40

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
                        text: foodListView.model[index].name
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

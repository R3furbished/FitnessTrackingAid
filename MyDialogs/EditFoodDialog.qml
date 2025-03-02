import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs

Dialog {
    id: editFoodDialog
    height: parent.height * 2 / 3 - 30
    width: parent.width - 40
    anchors.centerIn: parent
    modal: true
    focus: true

    Rectangle {
        id: formWindow
        color: "gray"
        radius: 5
        width: parent.width - 30
        height: parent.height - 40
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 5

        RowLayout {
            id: foodNameRow
            anchors.left: parent.left
            anchors.leftMargin: (parent.width / 2) - 70
            anchors.top: parent.top
            anchors.topMargin: 50
            height: 30
            width: parent.width / 3
            spacing: 10
            Label {
                text: "Name:"
                font.bold: true
                font.pixelSize: 15
            }

            TextField {
                id: foodName
                font.bold: true
                font.pixelSize: 15

                // This seems to be a hack, but it is able to get the name inside the clicked item;
                text: foodModel[foodListView.currentIndex].name
            }
        }

        RowLayout {
            id: foodGramsRow
            anchors.left: parent.left
            anchors.leftMargin: (parent.width / 2) - 70
            anchors.top: foodNameRow.bottom
            anchors.topMargin: 5
            height: 30
            width: parent.width / 3
            Label {
                text: "Grams:"
                font.bold: true
                font.pixelSize: 15
            }

            TextField {
                id: foodGrams
                font.bold: true
                font.pixelSize: 15

                // This seems to be a hack, but it is able to get the name inside the clicked item;
                text: foodModel[foodListView.currentIndex].grams_value
            }
        }
        RowLayout {
            id: foodCaloriesRow
            anchors.left: parent.left
            anchors.leftMargin: (parent.width / 2) - 70
            anchors.top: foodGramsRow.bottom
            anchors.topMargin: 5
            height: 30
            width: parent.width / 3
            spacing: 20
            Label {
                text: "Kcal:"
                font.bold: true
                font.pixelSize: 15
            }

            TextField {
                id: foodKcal
                font.bold: true
                font.pixelSize: 15

                // This seems to be a hack, but it is able to get the name inside the clicked item;
                text: foodModel[foodListView.currentIndex].calories
            }
        }
        RowLayout {
            id: foodProtRow
            anchors.left: parent.left
            anchors.leftMargin: (parent.width / 2) - 70
            anchors.top: foodCaloriesRow.bottom
            anchors.topMargin: 5
            height: 30
            width: parent.width / 3
            Label {
                text: "Protein:"
                font.bold: true
                font.pixelSize: 15
            }

            TextField {
                id: foodProt
                font.bold: true
                font.pixelSize: 15

                // This seems to be a hack, but it is able to get the name inside the clicked item;
                text: foodModel[foodListView.currentIndex].proteins
            }
        }
        RowLayout {
            id: foodFatsRow
            anchors.left: parent.left
            anchors.leftMargin: (parent.width / 2) - 70
            anchors.top: foodProtRow.bottom
            anchors.topMargin: 5
            height: 30
            width: parent.width / 3
            spacing: 25
            Label {
                text: "Fats:"
                font.bold: true
                font.pixelSize: 15
            }

            TextField {
                id: foodFat
                font.bold: true
                font.pixelSize: 15

                // This seems to be a hack, but it is able to get the name inside the clicked item;
                text: foodModel[foodListView.currentIndex].fats
            }
        }
        RowLayout {
            id: foodCarbsRow
            anchors.left: parent.left
            anchors.leftMargin: (parent.width / 2) - 70
            anchors.top: foodFatsRow.bottom
            anchors.topMargin: 5
            height: 30
            width: parent.width / 3
            spacing: 10
            Label {
                text: "Carbs:"
                font.bold: true
                font.pixelSize: 15
            }

            TextField {
                //TODO:: Replace this for a combination of Label and TextField
                id: foodCarbs
                font.bold: true
                font.pixelSize: 15

                // This seems to be a hack, but it is able to get the name inside the clicked item;
                text: foodModel[foodListView.currentIndex].carbs
            }
        }
    }
    Button {
        id: cancelButton
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        text: qsTr("Cancel")
        onClicked: {
            editFoodDialog.close()
        }
    }
    Button {
        id: doneButton
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        text: qsTr("Done")
    }

    Button {
        id: deleteButton
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        text: qsTr("Delete")
        onClicked: {
            if (deleteFoodDialogLoader.active === true) {
                deleteFoodDialogLoader.active = false
            }
            deleteFoodDialogLoader.active = true
            deleteFoodDialogLoader.item.open()
        }
    }

    Loader {
        id: deleteFoodDialogLoader
        sourceComponent: MessageDialog {
            id: deleteFoodDialog
            text: qsTr("The selected Item will be deleted.")
            informativeText: qsTr("Do you wish to proceed?")
            buttons: MessageDialog.Ok | MessageDialog.Cancel
            onButtonClicked: function (button, role) {
                if (button === MessageDialog.Ok) {
                    accept()
                } else {
                    reject()
                }
            }
            onAccepted: {
                deleteFoodDialog.close()
                editFoodDialog.close()
            }
            onRejected: {
                deleteFoodDialog.close()
            }
        }
    }
}

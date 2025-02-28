import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Dialogs

Dialog {
    id: editFoodDialog
    height: parent.height * 2 / 3
    width: parent.width - 20
    anchors.centerIn: parent
    modal: true
    focus: true
    title: "Edit current Item"

    Rectangle {
        id: formWindow
        color: "gray"
        radius: 5
        width: parent.width - 30
        height: parent.height - 40
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 5

        //TODO:: Add in the user Input fields for:
        //   -> Food name;
        //   -> Grams for food;
        TextField {
            id: foodName
            // This seems to be a hack, but it is able to get the name inside the clicked item;
            placeholderText: foodModel[foodListView.currentIndex].name
            onAccepted: foodModel[foodListView.currentIndex].name = text
        }
        TextField {
            anchors.top: foodName.bottom
            text: "boas"
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

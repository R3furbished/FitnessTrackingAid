import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs

Dialog {
    id: foodFormDialog
    height: (parent.height * 2 / 3) - 90
    width: parent.width - 60
    anchors.centerIn: parent
    modal: true
    focus: true
    Label {
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 10
        text: "Create New Food Item: "
        font.bold: true
        font.pixelSize: 20
    }

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
            id: nameLabel
            text: "Name:"
            font.bold: true
            font.pixelSize: 15
        }

        TextField {
            id: foodName
            font.bold: true
            font.pixelSize: 15
            placeholderText: "Name"
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
        spacing: 4
        Label {
            id: gramsLabel
            text: "Grams:"
            font.bold: true
            font.pixelSize: 15
        }

        TextField {
            id: foodGrams
            font.bold: true
            font.pixelSize: 15
            text: "100"
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
            id: kcalLabel
            text: "Kcal:"
            font.bold: true
            font.pixelSize: 15
        }

        TextField {
            id: foodKcal
            font.bold: true
            font.pixelSize: 15
            placeholderText: "Calories"
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
        spacing: 0
        Label {
            id: protLabel
            text: "Protein:"
            font.bold: true
            font.pixelSize: 15
        }

        TextField {
            id: foodProt
            font.bold: true
            font.pixelSize: 15
            text: "0"
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
        spacing: 21
        Label {
            id: fatLabel
            text: "Fats:"
            font.bold: true
            font.pixelSize: 15
        }

        TextField {
            id: foodFat
            font.bold: true
            font.pixelSize: 15
            text: "0"
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
        spacing: 8
        Label {
            id: carbLabel
            text: "Carbs:"
            font.bold: true
            font.pixelSize: 15
        }

        TextField {
            id: foodCarbs
            font.bold: true
            font.pixelSize: 15
            text: "0"
        }
    }
    Button {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        text: qsTr("Cancel")
        onClicked: {
            foodFormDialog.close()
        }
    }
    Button {
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        text: qsTr("Done")
        onClicked: {
            if (foodName.text !== "" && foodKcal.text !== "") {
                foodManagerModel.addFoodItem(foodName.text,
                                             parseInt(foodKcal.text),
                                             parseInt(foodGrams.text),
                                             parseInt(foodProt.text),
                                             parseInt(foodFat.text),
                                             parseInt(foodCarbs.text))
                foodFormDialog.close()
            } else {
                errorDialog.active = true
                errorDialog.item.open()
            }
        }
    }

    Loader {
        id: errorDialog
        sourceComponent: MessageDialog {
            id: errorMessage
            text: qsTr("Error: Name or Calories field is empty!")
            informativeText: qsTr("Please fill the missing field.")
            buttons: MessageDialog.Ok
            onButtonClicked: errorMessage.close()
        }
    }


}

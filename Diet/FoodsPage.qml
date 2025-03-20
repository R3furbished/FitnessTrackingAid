import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs
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
        height: parent.height - 190
        width: parent.width - 70
        radius: 5
        color: "#BE3144"

        ListView {
            id: foodListView
            anchors.fill: parent
            clip: true
            model: foodManagerModel.foods
            delegate: foodItemDelegate
            currentIndex: -1
        }
    }

    Component {
        id: foodItemDelegate
        Rectangle {
            id: foodElementContainer
            width: parent.width
            height: 40
            color: "gray"
            border.color: "black"
            radius: 10
            //Respond to loader changes
            onHeightChanged: {
                if (foodElementContainer.height !== 40) {
                    nonActivefoodLoader.active = false
                    editFoodElementLoader.active = true

                    //Need to disable mouse area to allow changes on
                    //TextFields inside the Rectangle
                    mouseArea.enabled = false
                } else {
                    editFoodElementLoader.active = false
                    nonActivefoodLoader.active = true
                    mouseArea.enabled = true
                }
            }

            Loader {
                id: nonActivefoodLoader
                anchors.fill: parent
                sourceComponent: Rectangle {
                    radius: 10
                    color: "gray"
                    border.color: "black"
                    anchors.fill: parent
                    Text {
                        text: foodManagerModel.foods[index].name
                        font.pixelSize: 20
                        font.bold: true
                        anchors.centerIn: parent
                    }
                }
                active: true
            }

            Loader {
                id: editFoodElementLoader
                anchors.fill: parent
                active: false
                sourceComponent: Rectangle {
                    radius: 10
                    color: "gray"
                    border.color: "black"
                    anchors.fill: parent
                    Rectangle {
                        id: minimizeButton
                        radius: 10
                        color: "gray"
                        border.color: "black"
                        anchors.top: parent.top
                        anchors.right: parent.right
                        anchors.left: parent.left
                        height: 45
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                foodElementContainer.height = 40
                            }
                        }
                    }
                    Text {
                        anchors.top: parent.top
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.topMargin: 10
                        text: "Edit " + foodManagerModel.foods[foodListView.currentIndex].name + ":"
                        font.bold: true
                        font.pixelSize: 20
                    }

                    RowLayout {
                        id: foodGramsRow
                        anchors.left: parent.left
                        anchors.leftMargin: (parent.width / 2) - 70
                        anchors.top: parent.top
                        anchors.topMargin: 50
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

                            text: foodManagerModel.foods[foodListView.currentIndex].grams_value
                            onEditingFinished: {
                                if (parseInt(foodManagerModel.foods[foodListView.currentIndex].grams_value) !== parseInt(
                                            foodGrams.text)) {
                                    saveButton.valid = true
                                }
                            }
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

                            text: foodManagerModel.foods[foodListView.currentIndex].calories
                            onEditingFinished: {
                                if (parseInt(foodManagerModel.foods[foodListView.currentIndex].calories) !== parseInt(
                                            foodKcal.text)) {
                                    saveButton.valid = true
                                }
                            }
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

                            text: foodManagerModel.foods[foodListView.currentIndex].proteins
                            onEditingFinished: {
                                if (parseInt(foodManagerModel.foods[foodListView.currentIndex].proteins) !== parseInt(
                                            foodProt.text)) {
                                    saveButton.valid = true
                                }
                            }
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

                            text: foodManagerModel.foods[foodListView.currentIndex].fats
                            onEditingFinished: {
                                if (parseInt(foodManagerModel.foods[foodListView.currentIndex].fats)
                                        !== parseInt(foodFat.text)) {
                                    saveButton.valid = true
                                }
                            }
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

                            text: foodManagerModel.foods[foodListView.currentIndex].carbs
                            onEditingFinished: {
                                if (parseInt(
                                            foodManagerModel.foods[foodListView.currentIndex].carbs)
                                        !== parseInt(foodCarbs.text)) {
                                    saveButton.valid = true
                                }
                            }
                        }
                    }
                    Button {
                        id: saveButton
                        anchors.bottom: parent.bottom
                        anchors.right: parent.right
                        anchors.bottomMargin: 5
                        anchors.rightMargin: 5
                        text: qsTr("Save")
                        visible: false
                        property bool valid: false
                        onValidChanged: {
                            if (valid === true) {
                                saveButton.visible = true
                            } else {
                                saveButton.visible = false
                            }
                        }

                        onClicked: {
                            if (saveButton.valid) {

                                foodManagerModel.foods[foodListView.currentIndex].grams_value
                                        = foodGrams.text
                                foodManagerModel.foods[foodListView.currentIndex].calories
                                        = foodKcal.text
                                foodManagerModel.foods[foodListView.currentIndex].proteins
                                        = foodProt.text
                                foodManagerModel.foods[foodListView.currentIndex].fats
                                        = foodFat.text
                                foodManagerModel.foods[foodListView.currentIndex].carbs
                                        = foodCarbs.text

                                //Force Reload on the loader by setting it to false;
                                if (saveFoodChangesLoader.active === true) {
                                    saveFoodChangesLoader.active = false
                                }
                                saveFoodChangesLoader.active = true
                                saveFoodChangesLoader.item.open()
                                saveButton.valid = false
                            }
                        }
                    }
                    Button {
                        id: deleteButton
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        anchors.bottomMargin: 5
                        anchors.leftMargin: 5
                        text: qsTr("Delete")
                        onClicked: {
                            //Setting active to true and false to remove Dialog from cache and force Reload
                            if (deleteFoodDialogLoader.active === true) {
                                deleteFoodDialogLoader.active = false
                            }
                            deleteFoodDialogLoader.active = true
                            deleteFoodDialogLoader.item.open()
                        }
                    }
                }
            }

            MouseArea {
                id: mouseArea
                anchors.fill: parent
                enabled: true
                onClicked: {

                    foodListView.currentIndex = index
                    //Loop over List and close Edit menu on all elements that are not
                    //the active one;
                    for (var i = 0; i < foodListView.count; i++) {
                        if (i !== foodListView.currentIndex) {
                            foodListView.itemAtIndex(i).height = 40
                        }
                    }
                    // Increase height and load in Edit Menu for active element
                    if (foodElementContainer.height === 40) {
                        foodElementContainer.height = 230
                        nonActivefoodLoader.active = false
                        editFoodElementLoader.active = true
                    }
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
        Text {
            text: "+"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: -15
            font.bold: true
            font.pixelSize: 70
        }
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
        id: deleteFoodDialogLoader
        active: false
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
                foodManagerModel.removeFoodItem(foodListView.currentIndex)
                deleteFoodDialog.close()
            }
            onRejected: {
                deleteFoodDialog.close()
            }
        }
    }

    Loader {
        id: saveFoodChangesLoader
        active: false
        sourceComponent: MessageDialog {
            id: saveFoodChangesDialog
            text: qsTr("Changes have been saved!")
            buttons: MessageDialog.Ok
            onButtonClicked: saveFoodChangesDialog.close()
        }
    }

    Component.onDestruction: console.log("Deleted FOOD page.")
}

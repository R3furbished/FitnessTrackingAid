import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Dialogs
import QtQuick.Layouts

Dialog {
    id: mealFormDialog
    height: (parent.height * 2 / 3) + 20
    width: parent.width - 20
    anchors.centerIn: parent
    modal: true
    focus: true
    closePolicy: Popup.NoAutoClose
    Rectangle {
        id: macrosDisplay
        anchors.top: parent.top
        anchors.topMargin: 5
        width: parent.width
        color: "lightblue"
        radius: 10
        height: 50
        RowLayout {
            width: parent.width - 20
            anchors.right: parent.right
            height: parent.height
            ColumnLayout {
                id: mealKcalColl
                Layout.maximumWidth: 40
                Text {
                    text: " Kcal"
                    font.bold: true
                }
                Text {
                    id: mealKcal
                    text: dayManagerModel.getLatestDay().getLatestMeal().calories
                    font.bold: true
                }
            }
            ColumnLayout {
                id: mealProtColl
                Layout.maximumWidth: 40
                Text {
                    text: "Prot"
                    font.bold: true
                }
                Text {
                    id: mealProts
                    text: dayManagerModel.getLatestDay().getLatestMeal().proteins
                    font.bold: true
                }
            }
            ColumnLayout {
                id: mealFatColl
                Layout.maximumWidth: 40
                Text {
                    text: "Fats"
                    font.bold: true
                }
                Text {
                    id: mealFats
                    text: dayManagerModel.getLatestDay().getLatestMeal().fats
                    font.bold: true
                }
            }
            ColumnLayout {
                id: mealCarbColl
                Layout.maximumWidth: 40
                Text {
                    text: "Carbs"
                    font.bold: true
                }
                Text {
                    id: mealCarbs
                    text: dayManagerModel.getLatestDay().getLatestMeal().carbs
                    font.bold: true
                }
            }
        }
    }

    Rectangle {
        width: parent.width / 2
        id: searchBar
        anchors.top: macrosDisplay.bottom
        anchors.topMargin: 5
        anchors.horizontalCenter: parent.horizontalCenter
        color: "gray"
        radius: 10
        height: 40
        TextField {
            id: searchBarText
            width: parent.width - 5
            height: parent.height - 5
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            placeholderText: "Search for food"
            font.bold: true
            font.pixelSize: 15
        }
    }

    ListView {
        id: foodListView
        anchors.top: searchBar.bottom
        anchors.topMargin: 10
        height: parent.height / 3
        width: parent.width
        clip: true
        model: foodManagerModel.getFoodItemWithName(searchBarText.text)
        delegate: ItemDelegate {
            id: foodItemDelegate
            width: parent.width
            height: 40

            Loader {

                id: nonActivefoodLoader
                anchors.fill: parent
                sourceComponent: Rectangle {
                    id: recting
                    radius: 10
                    color: "lightblue"
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
                        id: gramsValue
                        anchors.right: addButton.left
                        placeholderText: "grams"
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    Button {
                        id: addButton
                        height: parent.height - 10
                        width: 60
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        text: "ADD"
                        onClicked: {
                            if (parseInt(gramsValue.text) > 0) {
                                dayManagerModel.getLatestDay().getLatestMeal(
                                            ).addFood(
                                            foodListView.model[index],
                                            parseInt(gramsValue.text))
                            }
                        }
                    }
                }
                active: true
            }
        }
        currentIndex: -1
    }

    Rectangle {
        id: currentMeal
        anchors.top: foodListView.bottom
        anchors.topMargin: 5
        width: parent.width
        color: "lightblue"
        radius: 10
        height: 30
        Text {
            anchors.centerIn: parent
            text: "Items In Meal:"
            font.bold: true
        }
    }

    ListView {
        id: currentMealListView
        anchors.top: currentMeal.bottom
        height: parent.height / 4
        width: parent.width
        // anchors.fill: parent
        model: dayManagerModel.getLatestDay().getLatestMeal().foods
        clip: true
        spacing: 5
        currentIndex: -1
        delegate: ItemDelegate {
            id: currentMealItemDelegate
            width: parent.width
            height: 40

            Loader {
                id: currentMealLoader
                anchors.fill: parent
                sourceComponent: Rectangle {
                    id: recti
                    radius: 10
                    color: "gray"
                    border.color: "black"
                    anchors.fill: parent

                    Text {
                        id: mealFoodName
                        text: currentMealListView.model[index].name
                        font.pixelSize: 20
                        font.bold: true
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    TextField {
                        id: deleteGramsValue
                        anchors.right: mealDeleteButton.left
                        text: dayManagerModel.getLatestDay().getLatestMeal(
                                  ).gramsAtIndex[index]
                        anchors.verticalCenter: parent.verticalCenter
                        onTextEdited: {
                            mealDeleteButton.visible = false
                            mealEditButton.visible = true
                        }
                    }

                    Button {
                        id: mealDeleteButton
                        height: parent.height - 10
                        width: 80
                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        text: "Remove"
                        onClicked: {
                            dayManagerModel.getLatestDay().getLatestMeal(
                                        ).removeFood(index, parseInt(
                                                         deleteGramsValue.text))
                        }
                    }

                    Button {
                        id: mealEditButton
                        height: parent.height - 10
                        width: 80
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        text: "Edit"
                        visible: false
                        onClicked: {
                            dayManagerModel.getLatestDay().getLatestMeal(
                                        ).editFoodGramsValueAt(
                                        index, parseInt(deleteGramsValue.text))

                            mealEditButton.visible = false
                            mealDeleteButton.visible = true
                        }
                    }
                }
                active: true
            }
        }
    }

    Button {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        text: qsTr("Cancel")
        onClicked: {
            dayManagerModel.getLatestDay().deleteLastMeal()
            mealFormDialog.close()
        }
    }

    Button {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        text: qsTr("NewItem")
        onClicked: {
            console.log("TODO!! Needs to give a forum to fill with macro data and add it to the meal macros list.")
        }
    }
    Button {
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        text: qsTr("Done")
        onClicked: {
            if (dayManagerModel.getLatestDay().getLatestMeal().calories !== 0) {
                dayManagerModel.getLatestDay().addMeal(
                            dayManagerModel.getLatestDay().getLatestMeal())
            } else {
                dayManagerModel.getLatestDay().deleteLastMeal()
            }

            mealFormDialog.close()
        }
    }
}

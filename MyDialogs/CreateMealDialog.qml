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
        height: 40
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
                            // Getting the meal that was just created when clicking the button in DietPage
                            dayManagerModel.getLatestDay().getLatestMeal(
                                        ).addFood(foodListView.model[index])
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
        clip: true
        model: dayManagerModel.getLatestDay().getLatestMeal().foods
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
                        anchors.right: mealAddButton.left
                        placeholderText: "grams"
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    Button {
                        id: mealAddButton
                        height: parent.height
                        width: 80
                        anchors.right: parent.right
                        text: "Remove"
                        onClicked: {
                            // Getting the meal that was just created when clicking the button in DietPage
                            dayManagerModel.getDayWithDate(
                                        new Date().toLocaleDateString(
                                            Qt.locale(
                                                ).shortFormat)).getLatestMeal(
                                        ).removeFood(
                                        currentMealListView.model[index])
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
            dayManagerModel.getDayWithDate(
                        new Date().toLocaleDateString(
                            Qt.locale().shortFormat)).deleteLastMeal()
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
        onClicked: {
            mealFormDialog.close()
        }
    }
}

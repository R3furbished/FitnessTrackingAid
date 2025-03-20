import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Dialogs
import QtQuick.Layouts

Dialog {
    id: mealFormDialog
    height: parent.height * 2 / 3
    width: parent.width - 20
    anchors.centerIn: parent
    modal: true
    focus: true
    closePolicy: Popup.NoAutoClose
    property string timeStamp: "0"

    function updateMacrosListing() {
        mealKcal.text = dayManagerModel.days[0].getLatestMeal().calories
        mealProts.text = dayManagerModel.days[0].getLatestMeal().proteins
        mealCarbs.text = dayManagerModel.days[0].getLatestMeal().carbs
        mealFats.text = dayManagerModel.days[0].getLatestMeal().fats
    }

    Timer {
        id: updateTimer
        interval: 1000 // Runs every second
        running: false // Initially stopped
        repeat: true
        onTriggered: updateMacrosListing()
    }

    Rectangle {
        id: macrosDisplay
        width: parent.width
        color: "lightblue"
        radius: 10
        height: 40
        RowLayout {
            width: parent.width - 20
            anchors.right: parent.right
            height: parent.height
            ColumnLayout {
                id: mealKcalColl
                Layout.maximumWidth: 40
                Label {
                    text: "     Kcal"
                    font.bold: true
                }
                Text {
                    id: mealKcal
                    text: ""
                    font.bold: true
                }
            }
            ColumnLayout {
                id: mealProtColl
                Layout.maximumWidth: 40
                Label {
                    text: "   Prot"
                    font.bold: true
                }
                Text {
                    id: mealProts
                    text: ""
                    font.bold: true
                }
            }
            ColumnLayout {
                id: mealFatColl
                Layout.maximumWidth: 40
                Label {
                    text: "  Fats"
                    font.bold: true
                }
                Text {
                    id: mealFats
                    text: ""
                    font.bold: true
                }
            }
            ColumnLayout {
                id: mealCarbColl
                Layout.maximumWidth: 40
                Label {
                    text: "  Carbs"
                    font.bold: true
                }
                Text {
                    id: mealCarbs
                    text: ""
                    font.bold: true
                }
            }
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
                        id: gramsValue
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
                            // Check if there is a new Meal Object before adding the food item to it;
                            // The null check in the if statement is to create the Meal Object when the
                            // day has had no meal yet;
                            if (dayManagerModel.getLatestDay().getLatestMeal(
                                        ) === null
                                    || dayManagerModel.getLatestDay(
                                        ).getLatestMeal(
                                        ).timeStamp !== mealFormDialog.timeStamp) {
                                dayManagerModel.getLatestDay().createMeal(
                                            timeStamp)
                                loaderComponentMealLV.active = true
                            }
                            dayManagerModel.getLatestDay().getLatestMeal(
                                        ).addFood(foodListView.model[index],
                                                  parseInt(gramsValue.text))

                            updateMacrosListing()
                            if (!updateTimer.running) {
                                updateTimer.start()
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
    Loader {
        id: loaderComponentMealLV
        active: false
        anchors.top: currentMeal.bottom
        height: parent.height / 4
        width: parent.width
        sourceComponent: Component {
            id: mealComponentLV
            ListView {
                id: currentMealListView
                anchors.fill: parent
                model: dayManagerModel.getLatestDay().getLatestMeal().foods
                clip: true
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
                                text: dayManagerModel.getLatestDay(
                                          ).getLatestMeal().gramsAtIndex[index]
                                anchors.verticalCenter: parent.verticalCenter
                            }

                            Button {
                                id: mealDeleteButton
                                height: parent.height
                                width: 80
                                anchors.right: parent.right
                                text: "Remove"
                                onClicked: {
                                    dayManagerModel.getLatestDay(
                                                ).getLatestMeal().removeFood(
                                                currentMealListView.model[index],
                                                parseInt(deleteGramsValue.text))
                                }
                            }
                        }
                        active: true
                    }
                }
                currentIndex: -1
            }
        }
    }
    Button {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        text: qsTr("Cancel")
        onClicked: {
            updateTimer.stop()
            mealFormDialog.close()
            dayManagerModel.getLatestDay().deleteLastMeal()
        }
    }

    Button {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        text: qsTr("Add")
        onClicked: {
            updateTimer.stop()
            console.log("TODO!! Needs to give a forum to fill with macro data and add it to the meal macros list.")
        }
    }
    Button {
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        text: qsTr("Done")
        onClicked: {
            updateTimer.stop()
            mealFormDialog.close()
        }
    }
    Component.onCompleted: {
        mealFormDialog.timeStamp = Qt.formatTime(new Date(), "hh:mm:ss")
    }
}

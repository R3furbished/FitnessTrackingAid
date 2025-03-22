import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs
import "../MyDialogs"

//Missing -> C++ data interaction and displaying the model
Page {

    Rectangle {
        id: backgroundRectangle
        anchors.fill: parent
        height: parent.height
        width: parent.width
        color: "#22092C"
    }

    Rectangle {
        property int kcal: dayManagerModel.getLatestDay().dayKcal
        property int prot: dayManagerModel.getLatestDay().dayProt
        property int fat: dayManagerModel.getLatestDay().dayFats
        property int carb: dayManagerModel.getLatestDay().dayCarbs
        id: macroPlacement
        width: mealListPlacement.width
        height: 70
        radius: 10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 10
        color: "lightgreen"
        RowLayout {
            width: parent.width - 5
            anchors.right: parent.right
            height: parent.height
            ColumnLayout {
                id: kcalColl
                Layout.maximumWidth: 40
                Label {
                    text: "     Kcal"
                    font.bold: true
                }
                Text {
                    text: "" + macroPlacement.kcal + "/" + user.daily_cal
                    font.bold: true
                }
                ProgressBar {
                    id: kcalProgressBar
                    Layout.maximumHeight: 10
                    Layout.maximumWidth: 75
                    from: 0
                    to: 1
                    value: macroPlacement.kcal / user.daily_cal
                }
            }
            ColumnLayout {
                id: protColl
                Layout.maximumWidth: 40
                Label {
                    text: "   Prot"
                    font.bold: true
                }
                Text {
                    text: "  " + macroPlacement.prot + "/" + user.prot_target
                    font.bold: true
                }
                ProgressBar {
                    id: protProgressBar
                    Layout.maximumHeight: 10
                    Layout.maximumWidth: 75
                    from: 0
                    to: 1
                    value: macroPlacement.prot / user.prot_target
                }
            }
            ColumnLayout {
                id: fatColl
                Layout.maximumWidth: 40
                Label {
                    text: "  Fats"
                    font.bold: true
                }
                Text {
                    text: " " + macroPlacement.fat + "/" + user.fat_target
                    font.bold: true
                }
                ProgressBar {
                    id: fatProgressBar
                    Layout.maximumHeight: 10
                    Layout.maximumWidth: 75
                    from: 0
                    to: 1
                    value: macroPlacement.fat / user.fat_target
                }
            }
            ColumnLayout {
                id: carbColl
                Layout.maximumWidth: 40
                Label {
                    text: "  Carbs"
                    font.bold: true
                }
                Text {
                    text: " " + macroPlacement.carb + "/" + user.carb_target
                    font.bold: true
                }
                ProgressBar {
                    id: carbProgressBar
                    Layout.maximumHeight: 10
                    Layout.maximumWidth: 75
                    from: 0
                    to: 1
                    value: macroPlacement.carb / user.carb_target
                }
            }
        }
    }

    Rectangle {
        id: mealListPlacement
        anchors.top: macroPlacement.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width - 30
        height: parent.height - 200
        color: "#872341"

        ListView {
            id: mealListView
            anchors.fill: parent
            //we index the model at 0, because we always prepend when creating a newDay
            //therefor the most recent day is always at position 0.
            model: dayManagerModel.getLatestDay().meals
            delegate: ItemDelegate {
                id: mealItemDelegate
                width: parent.width
                height: 50

                Loader {
                    anchors.fill: parent
                    sourceComponent: Rectangle {
                        id: re
                        radius: 4
                        color: "lightblue"
                        border.color: "black"
                        anchors.fill: parent

                        //TODO:: Quick Hack to be able to Delete , should be a button or slider
                        MouseArea {
                            id: deleteInteraction
                            anchors.fill: parent
                            onClicked: {
                                mealListView.currentIndex = index
                                if (deleteMealDialogLoader.active === true) {
                                    deleteMealDialogLoader.active = false
                                }
                                deleteMealDialogLoader.active = true
                                deleteMealDialogLoader.item.open()
                                console.log(mealListView.currentIndex)
                            }
                        }

                        Text {
                            id: mealDate
                            text: mealListView.model[index].timeStamp
                            font.pixelSize: 15
                            font.bold: true
                            anchors.left: parent.left
                            anchors.leftMargin: 10
                            anchors.verticalCenter: parent.verticalCenter
                        }
                        Rectangle {
                            id: div
                            height: parent.height - 5
                            width: 3
                            color: "black"
                            anchors.left: parent.left
                            anchors.leftMargin: 81
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        RowLayout {
                            anchors.left: div.right
                            anchors.leftMargin: 7
                            anchors.right: parent.right
                            anchors.top: parent.top
                            anchors.bottom: parent.bottom
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
                                    text: dayManagerModel.days[0].meals[index].calories
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
                                    text: dayManagerModel.days[0].meals[index].proteins
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
                                    text: dayManagerModel.days[0].meals[index].fats
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
                                    text: dayManagerModel.days[0].meals[index].carbs
                                    font.bold: true
                                }
                            }
                        }
                    }
                    active: true
                }
            }
            currentIndex: -1
        }
    }

    Rectangle {
        id: addMealButton
        anchors.top: mealListPlacement.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        height: 54
        width: 54
        radius: 27
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
                //TODO!!!!!!!
                // Eventually should be automatic on APP loading instead of button pressing;

                //TODO:: Is this the best way of doing it?
                // We need 2 methods to be created one that gets the currentDay from the manager;
                // and another that from that day calls createMeal()
                //!Todo("Create this meal here , and use it inside the Dialog
                //but in case the cancell button is press or we close
                //the dialog, the meal that was created here should be
                //deleted by calling:
                //>dayManagerModel.currentDay().deleteLastMeal()
                dayManagerModel.getLatestDay().createMeal(Qt.formatTime(
                                                              new Date(),
                                                              "hh:mm:ss"))

                //Setting active to true and false to force the Loader to uncache the Dialog.
                if (addMealDialogLoader.active === true) {
                    addMealDialogLoader.active = false
                }

                addMealDialogLoader.active = true
                addMealDialogLoader.item.open()
            }
        }
    }

    Loader {
        id: deleteMealDialogLoader
        active: false
        sourceComponent: MessageDialog {
            id: deleteMealDialog
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
                dayManagerModel.getLatestDay().removeMeal(
                            mealListView.currentIndex)
                deleteMealDialog.close()
            }
            onRejected: {
                deleteMealDialog.close()
            }
        }
    }

    Loader {
        id: addMealDialogLoader
        anchors.fill: parent
        sourceComponent: CreateMealDialog {
            id: addMealDialog
        }
    }
}

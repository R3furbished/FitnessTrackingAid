import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
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
        property int kcal: 2005
        property int prot: 120
        property int fat: 50
        property int carb: 80
        id: macroPlacement
        width: mealListPlacement.width
        height: 50
        radius: 10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 10
        color: "gray"
        RowLayout {
            width: parent.width - 20
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
            }
            ColumnLayout {
                id: protColl
                Layout.maximumWidth: 40
                Label {
                    text: "   Prot"
                    font.bold: true
                }
                Text {
                    text: "" + macroPlacement.prot + "/" + user.prot_target
                    font.bold: true
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
                    text: "" + macroPlacement.fat + "/" + user.fat_target
                    font.bold: true
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
                    text: "" + macroPlacement.carb + "/" + user.carb_target
                    font.bold: true
                }
            }
        }
    }

    Rectangle {
        id: mealListPlacement
        anchors.top: macroPlacement.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width - 70
        height: parent.height - 200
        color: "#872341"

        ListView {
            id: mealListView
            anchors.fill: parent
            //we index the model at 0, because we always prepend when creating a newDay
            //therefor the most recent day is always at position 0.
            model: dayManagerModel.days[0].meals
            delegate: ItemDelegate {
                id: mealItemDelegate
                width: parent.width
                height: 40

                Loader {
                    anchors.fill: parent
                    sourceComponent: Rectangle {
                        id: re
                        radius: 10
                        color: "gray"
                        border.color: "black"
                        anchors.fill: parent

                        Text {
                            id: mealDate
                            text: mealListView.model[index].timeStamp
                            font.pixelSize: 20
                            font.bold: true
                            anchors.left: parent.left
                            anchors.leftMargin: 10
                            anchors.verticalCenter: parent.verticalCenter
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
                //TODO!!!!!!!
                // Eventually should be automatic on APP loading instead of button pressing;
                if (!dayManagerModel.hasDayWithDate(
                            new Date().toLocaleDateString(Qt.locale(
                                                              ).shortFormat))) {

                    dayManagerModel.newDay(new Date().toLocaleDateString(
                                               Qt.locale().shortFormat))
                }
                //TODO:: Is this the best way of doing it?
                // We need 2 methods to be created one that gets the currentDay from the manager;
                // and another that from that day calls createMeal()
                //!Todo("Create this meal here , and use it inside the Dialog
                //but in case the cancell button is press or we close
                //the dialog, the meal that was created here should be
                //deleted by calling:
                //>dayManagerModel.currentDay().deleteLastMeal()
                // dayManagerModel.getLatestDay().createMeal(Qt.formatTime(
                //                                               new Date(),
                //                                               "hh:mm:ss"))

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
        id: addMealDialogLoader
        anchors.fill: parent
        sourceComponent: CreateMealDialog {
            id: addMealDialog
        }
    }
}

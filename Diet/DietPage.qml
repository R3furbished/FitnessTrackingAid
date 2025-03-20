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

        // Text {
        //     id: macroLegendTextField
        //     anchors.horizontalCenter: parent.horizontalCenter
        //     anchors.top: parent.top
        //     text: "   Kcal  |  Prot  |  Fats  | Carbs "
        //     font.bold: true
        // }
        // Text {
        //     id: macroPlacementTextField
        //     anchors.horizontalCenter: parent.horizontalCenter
        //     anchors.bottom: parent.bottom
        //     text: "" + macroPlacement.kcal + "/" + user.daily_cal + " "
        //           + macroPlacement.prot + "/" + user.prot_target + " "
        //           + macroPlacement.fat + "/" + user.fat_target + " "
        //           + macroPlacement.carb + "/" + user.carb_target + " "
        //     font.bold: true
        // }
    }

    Rectangle {
        id: mealListPlacement
        anchors.top: macroPlacement.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width - 70
        height: parent.height - 200
        color: "#872341"

        //Get the ListView in here;
        ListView {
            id: mealListView
            anchors.fill: parent
            model: mealManagerModel.meals
            delegate: mealDelegate
            currentIndex: -1
        }
    }
    Component {
        id: mealDelegate
        Rectangle {
            width: parent.width
            height: 40
            color: "gray"
            border.color: "black"

            radius: 10
            //TODO:: Actually think how to display each meal in the list
            Text {
                text: mealManagerModel.meals[index].name
                font.pixelSize: 20
                font.bold: true
                anchors.centerIn: parent
            }
            //TODO:: add a mouse area to get info on clicked Meal;
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
                dayManagerModel.getDayWithDate(
                            new Date().toLocaleDateString(
                                Qt.locale().shortFormat)).createMeal()

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

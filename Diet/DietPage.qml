import QtQuick 2.15
import QtQuick.Controls
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
        id: macroPlacement
        width: mealListPlacement.width
        height: 50
        radius: 10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 10
        color: "gray"
        Text {
            anchors.centerIn: parent
            text: new Date().toLocaleDateString(Qt.locale().shortFormat)
            font.bold: true
        }
        Button {
            text: "a"
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            width: 20
            onClicked: {
                //TODO!!!!!!!
                // Eventually should be automatic on APP loading instead of button pressing;
                if (!dayManagerModel.hasDayWithDate(
                            new Date().toLocaleDateString(Qt.locale(
                                                              ).shortFormat))) {

                    dayManagerModel.newDay(new Date().toLocaleDateString(
                                               Qt.locale().shortFormat))
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
        MouseArea {
            anchors.fill: parent
            onClicked: {
                //TODO:: Is this the best way of doing it?
                // We need 2 methods to be created one that gets the currentDay from the manager;
                // and another that from that day calls createMeal()
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

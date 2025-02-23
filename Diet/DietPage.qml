import QtQuick 2.15
import QtQuick.Controls

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
        width: mealListPlace.width
        height: 50
        radius: 10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: mealListPlace.top
        anchors.bottomMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        color: "gray"
    }

    Rectangle {
        id: mealListPlace
        anchors.top: parent.top
        anchors.topMargin: 70
        anchors.horizontalCenter: parent.horizontalCenter
        width: 316
        height: 410
        color: "#872341"
    }

    Rectangle {
        id: addFoddButton
        anchors.top: mealListPlace.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        height: 60
        width: 60
        radius: 30
        color: "#872341"
    }

    Rectangle {
        id: bottomBar
        height: 40
        width: parent.width
        anchors.bottom: parent.bottom
        color: "black"

        Button {
            width: 80
            anchors.verticalCenter: bottomBar.verticalCenter
            anchors.left: bottomBar.left
            text: "food"
        }
        Button {
            width: 80
            anchors.centerIn: parent
            anchors.verticalCenter: bottomBar.verticalCenter
            text: "macros"
        }
        Button {
            width: 80
            anchors.verticalCenter: bottomBar.verticalCenter
            anchors.right: bottomBar.right
            text: "stats"
        }
    }

    // footer: TabBar {
    //     id: dietPageToolBar
    //     // Add Food | Add Meal | Save Day
    //     TabButton {
    //         id: addMeal
    //         text: "Add Meal"
    //     }
    //     TabButton {
    //         id: showMacros
    //         text: "Macros"
    //     }
    //     TabButton {
    //         id: more
    //         text: "More"
    //     }
    // }
}

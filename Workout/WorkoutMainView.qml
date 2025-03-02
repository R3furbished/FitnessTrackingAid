import QtQuick 2.15
import QtQuick.Controls

//Needs to contain all NavBars here
Page {
    StackView {
        id: mainStack
        height: parent.height
        width: parent.width
        initialItem: workoutView

        WorkoutPage {
            id: workoutView
        }
    }

    Rectangle {
        id: bottomNavBar
        height: 50
        width: parent.width
        anchors.bottom: parent.bottom
        Loader {
            id: navBarLoader
            anchors.fill: parent
            sourceComponent: workoutNavBarComponent
        }
    }

    Component {
        id: workoutNavBarComponent
        Item {

            Rectangle {
                id: bottomBar
                height: bottomNavBar.height
                width: parent.width
                anchors.bottom: parent.bottom
                color: "black"

                Button {

                    width: 80
                    height: bottomBar.height
                    anchors.verticalCenter: bottomBar.verticalCenter
                    anchors.left: bottomBar.left
                    text: "exercis"
                    // onClicked: {
                    //     foody.open()
                    // }
                }
                Button {
                    width: 80
                    height: bottomBar.height
                    anchors.centerIn: parent
                    anchors.verticalCenter: bottomBar.verticalCenter
                    text: "plans"
                }
                Button {
                    width: 80
                    height: bottomBar.height
                    anchors.verticalCenter: bottomBar.verticalCenter
                    anchors.right: bottomBar.right
                    text: "stats"
                }
            }
        }
    }
}

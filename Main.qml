import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "PageElements/"
import "Diet"
import "Workout"

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("KhanFit")

    header: ToolBar {
        id: topHeader
        RowLayout {
            width: parent.width
            height: parent.height
            anchors.top: parent.top
            spacing: 10
            TabButton {
                text: ">"
            }

            TabBar {
                id: tabBar
                Layout.fillWidth: true
                TabButton {
                    text: qsTr("Diet")
                }
                TabButton {
                    text: qsTr("Workout")
                }
            }
        }
    }

    Drawer {
        id: drawerTab
        height: parent.height
        width: parent.width * 2 / 3
        interactive: true
    }

    StackLayout {
        anchors.top: topHeader.bottom
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.left: parent.left
        currentIndex: tabBar.currentIndex
        StackView {
            id: dietTab
            height: parent.height
            width: parent.width
            initialItem: dietView

            DietPage {
                id: dietView
            }
        }

        StackView {
            id: workoutTab
            height: parent.height
            width: parent.width
            initialItem: workoutView

            WorkoutPage {
                id: workoutView
            }
        }
    }
}

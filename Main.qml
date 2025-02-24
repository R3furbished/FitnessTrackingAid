import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "PageElements/"
import "Diet"
import "Workout"

ApplicationWindow {
    width: 480
    height: 640
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
                text: "☰"
                font.pixelSize: 20
                font.bold: true
                onClicked: {
                    drawer.open()
                }
            }

            TabBar {
                id: tabBar
                Layout.fillWidth: true
                TabButton {
                    text: qsTr("Diet")
                    font.bold: true
                    font.pixelSize: 20
                }
                TabButton {
                    text: qsTr("Workout")
                    font.bold: true
                    font.pixelSize: 20
                }
            }
        }
    }

    Drawer {
        id: drawer
        height: parent.height
        width: parent.width * 1 / 2
        interactive: true
        background: Rectangle {
            color: "black"
        }

        ListView {
            id: drawerContent
            anchors.fill: parent

            Loader {
                id: drawerLoader
                anchors.fill: parent
                sourceComponent: dietDrawerContent
            }
        }
    }

    Component {
        id: dietDrawerContent
        DietDrawerContent {}
    }

    Component {
        id: workoutDrawerContent
        WorkoutDrawerContent {}
    }

    StackLayout {
        id: mainLayout
        anchors.top: topHeader.bottom
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.left: parent.left
        currentIndex: tabBar.currentIndex

        DietMainView {
            id: dietView
        }

        WorkoutMainView {
            id: workoutView
        }
    }

    Connections {
        //Controlls which Component gets Loaded by the Column element inside the Drawer;
        target: mainLayout
        function onCurrentIndexChanged() {
            if (mainLayout.currentIndex === 0) {
                //navBarLoader.sourceComponent = dietNavBarContent
                drawerLoader.sourceComponent = dietDrawerContent
            } else if (mainLayout.currentIndex === 1) {
                //navBarLoader.sourceComponent = workoutNavBarContent
                drawerLoader.sourceComponent = workoutDrawerContent
            }
        }
    }
}

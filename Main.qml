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

    // Component {
    //     id: dietNavBarContent
    //     Item {

    //         Rectangle {
    //             id: bottomBar
    //             height: 40
    //             width: parent.width
    //             anchors.bottom: parent.bottom
    //             color: "orange"

    //             Button {
    //                 width: 80
    //                 anchors.verticalCenter: bottomBar.verticalCenter
    //                 anchors.left: bottomBar.left
    //                 text: "food"
    //                 onClicked: {
    //                     dietTab.push("./Diet/FoodsPage.qml") //Note: does this need to be in qrc: ?
    //                 }
    //             }
    //             Button {
    //                 width: 80
    //                 anchors.centerIn: parent
    //                 anchors.verticalCenter: bottomBar.verticalCenter
    //                 text: "macros"
    //                 onClicked: {
    //                     dietTab.pop()
    //                 }
    //             }
    //             Button {
    //                 width: 80
    //                 anchors.verticalCenter: bottomBar.verticalCenter
    //                 anchors.right: bottomBar.right
    //                 text: "stats"
    //             }
    //         }
    //     }
    // }

    // Component {
    //     id: workoutNavBarContent
    //     WorkoutNavBar {}
    // }
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

    // Rectangle {
    //     id: bottomNavBar
    //     height: 40
    //     width: parent.width
    //     anchors.bottom: parent.bottom
    //     Loader {
    //         id: navBarLoader
    //         anchors.fill: parent
    //         sourceComponent: dietNavBarContent
    //     }
    // }
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

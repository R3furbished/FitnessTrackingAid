import QtQuick 2.15
import QtQuick.Controls

//Needs to contain all NavBars here
Page {
    StackView {
        id: mainStack
        height: parent.height
        width: parent.width
        initialItem: dietView

        DietPage {
            id: dietView
        }
    }

    Rectangle {
        id: bottomNavBar
        height: 40
        width: parent.width
        anchors.bottom: parent.bottom
        Loader {
            id: navBarLoader
            anchors.fill: parent
            sourceComponent: dietNavBarComponent
        }
    }

    Component {
        id: dietNavBarComponent
        Item {
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
                    onClicked: {
                        mainStack.push("./FoodsPage.qml")
                        navBarLoader.sourceComponent = foodsNavBarComponent
                    }
                }
                Button {
                    width: 80
                    anchors.centerIn: parent
                    anchors.verticalCenter: bottomBar.verticalCenter
                    text: "macros"
                    onClicked: {
                        mainStack.push("./MacrosPage.qml")
                        navBarLoader.sourceComponent = macrosNavBarComponent
                    }
                }
                Button {
                    width: 80
                    anchors.verticalCenter: bottomBar.verticalCenter
                    anchors.right: bottomBar.right
                    text: "stats"
                    onClicked: {
                        mainStack.push("./StatsPage.qml")
                        navBarLoader.sourceComponent = statsNavBarComponent
                    }
                }
            }
        }
    }

    Component {
        id: foodsNavBarComponent
        Item {

            Rectangle {
                id: bottomBar
                height: 40
                width: parent.width
                anchors.bottom: parent.bottom
                color: "black"

                Button {
                    width: 80
                    anchors.verticalCenter: bottomBar.verticalCenter
                    anchors.horizontalCenter: bottomBar.horizontalCenter
                    text: "⛠"
                    onClicked: {
                        mainStack.pop()
                        navBarLoader.sourceComponent = dietNavBarComponent
                    }
                }
            }
        }
    }

    Component {
        id: macrosNavBarComponent
        Item {

            Rectangle {
                id: bottomBar
                height: 40
                width: parent.width
                anchors.bottom: parent.bottom
                color: "black"

                Button {
                    width: 80
                    anchors.verticalCenter: bottomBar.verticalCenter
                    anchors.horizontalCenter: bottomBar.horizontalCenter
                    text: "⛠"
                    onClicked: {
                        mainStack.pop()
                        navBarLoader.sourceComponent = dietNavBarComponent
                    }
                }
            }
        }
    }

    Component {
        id: statsNavBarComponent
        Item {

            Rectangle {
                id: bottomBar
                height: 40
                width: parent.width
                anchors.bottom: parent.bottom
                color: "black"

                Button {
                    width: 80
                    anchors.verticalCenter: bottomBar.verticalCenter
                    anchors.horizontalCenter: bottomBar.horizontalCenter
                    text: "⛠"
                    onClicked: {
                        mainStack.pop()
                        navBarLoader.sourceComponent = dietNavBarComponent
                    }
                }
            }
        }
    }
}

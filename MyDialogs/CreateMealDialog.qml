import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Dialogs

Dialog {
    id: mealFormDialog
    height: parent.height * 2 / 3
    width: parent.width - 20
    anchors.centerIn: parent
    title: "Add Meal To The Day"

    Rectangle {
        id: formWindow
        color: "purple"
        radius: 5
        width: parent.width - 30
        height: parent.height - 40
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 5

        //TODO:: Add in the user Input fields for:
        //   -> Food name;
        //   -> Grams for food;
    }
    Button {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        text: qsTr("Cancel")
        onClicked: {
            mealFormDialog.close()
        }
    }
    Button {
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        text: qsTr("Done")
    }
}

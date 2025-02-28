import QtQuick 2.15
import QtQuick.Controls

Dialog {
    id: foodFormDialog
    height: parent.height * 2 / 3
    width: parent.width - 20
    anchors.centerIn: parent
    modal: true
    focus: true
    title: "Create a New Food Item"

    Rectangle {
        id: formWindow
        color: "#FF9D23"
        radius: 5
        width: parent.width - 30
        height: parent.height - 40
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 5

        TextField {
            id: foodName
            width: parent.width / 2
            placeholderText: "Food Name"
            placeholderTextColor: "white"
            anchors.centerIn: parent
            background: Rectangle {
                radius: 10
                color: "gray"
            }
        }
        TextField {
            id: calories
            width: parent.width / 2
            placeholderTextColor: "white"
            background: Rectangle {
                radius: 10
                color: "gray"
            }
            anchors.top: foodName.bottom
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: "Calories"
            onFocusChanged: {
                if (calories.text === "") {
                    calories.text = "10000"
                }
            }
        }

        //TODO:: Add in the user Input fields for:
        //   -> Food name;
        //   -> Grams for baseline macros;
        //   -> Calories per grams;
        //   -> Proteins per grams; *Optional*
        //   -> Fats per grams; 	*Optional*
        //   -> Carbs per grams; 	*Optional*
    }
    Button {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        text: qsTr("Cancel")
        onClicked: {
            foodFormDialog.close()
        }
    }
    Button {
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        text: qsTr("Done")
        onClicked: {
            //TODO:: clean this UP!!!!!!
            foodModel.append(new FoodItem(foodName.text,
                                          parseInt(calories.text)))
            console.log(foodName.text + ": " + calories.text)
        }
    }
}

/*
Dialog {
    id: foodFormDialog
    height: parent.height * 2 / 3
    width: parent.width - 20
    anchors.centerIn: parent
    Rectangle {
        id: formWindow
        color: "cyan"
        radius: 5
        width: parent.width - 60
        height: parent.height - 80
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 30
        anchors.bottomMargin: 30
        //TODO:: Add in the user Input fields for:
        //   -> Food name;
        //   -> Grams for baseline macros;
        //   -> Calories per grams;
        //   -> Proteins per grams; *Optional*
        //   -> Fats per grams; 	*Optional*
        //   -> Carbs per grams; 	*Optional*
    }

    Rectangle {
        id: doneButton
        color: "green"
        radius: 5
        width: 100
        height: 40
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.bottomMargin: 5
        anchors.rightMargin: 5

        Text {
            anchors.centerIn: doneButton
            text: "Done"
            font.bold: true
            font.pixelSize: 30
        }
        //TODO:: Saves state to C++ code and closes popup , returning to DietView;
    }

    Rectangle {
        id: cancelButton
        color: "green"
        radius: 5
        width: 100
        height: 40
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.bottomMargin: 5
        anchors.leftMargin: 5

        Text {
            anchors.centerIn: cancelButton
            text: "Cancel"
            font.bold: true
            font.pixelSize: 30
        }
        MouseArea {
            anchors.fill: parent
            onClicked: foodFormDialog.reject()
        }

        //TODO:: Discards all state and closes popup , returning to DietView;
    }
    // }
}
*/


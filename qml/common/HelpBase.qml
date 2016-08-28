import VPlay 2.0
import QtQuick 2.0
import "../"

Rectangle {
    id: helpBase
    anchors.fill: parent
    color: "magenta"
    border.color: "white"
    border.width: 2
    anchors.margins: 2

    signal btnBackPressed

    MenuButton {
        text: GameInfo.langBack
        textColor: "white"
        color: "red"
        border.color: "white"
        width: parent.width/4
        anchors.top: parent.top
        opacity: 0.7

        onClicked: {
            btnBackPressed()
        }
    }

//    Rectangle {
//        id: goBack
//        anchors.top: parent.top
//        anchors.topMargin: 3
//        anchors.horizontalCenter:  parent.horizontalCenter
//        color: "white"
//        border.color: "lime"
//        border.width: 1
//        radius: 10
//        opacity: 0.7

//        height: goBackTxt.height + 5

//        width: parent.width / 4

//        Text {
//            id: goBackTxt
//            text: qsTr(GameInfo.langBack)
//            font.pixelSize: 10
//            color: 'black'
//            anchors.centerIn: parent
//        }
//        MouseArea {
//            anchors.fill: parent
//            onClicked: {
//                btnBackPressed()
//            }
//        }
//    }
}

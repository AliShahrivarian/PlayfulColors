import VPlay 2.0
import QtQuick 2.0
import ".."
import "../common"

SceneBase {
    id: creditsScene

    // background
    Rectangle {
        anchors.fill: parent.gameWindowAnchorItem
        color: "white"
    }

    // back button to leave scene
    MenuButton {
        text: GameInfo.langBack
        // anchor the button to the gameWindowAnchorItem to be on the edge of the screen on any device
        anchors.right: creditsScene.gameWindowAnchorItem.right
        anchors.rightMargin: 10
        anchors.top: creditsScene.gameWindowAnchorItem.top
        anchors.topMargin: 10
        onClicked: backButtonPressed()
    }

    Column {
        anchors.centerIn: parent
        spacing: 10
        width: parent.width * 0.9
        z: 100
        Text {
            text: "E-Mail: Ali.Shahrivarian@gmail.com"
            color: "black"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    Qt.openUrlExternally("mailto:Ali.Shahrivarian@gmail.com")
                }
            }
        }
        Text {
            text: qsTr("Linkedin: ali-shahrivarian-78a29084 (Open url)")
            color: "black"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    Qt.openUrlExternally("https://ir.linkedin.com/in/ali-shahrivarian-78a29084")
                }
            }
        }
    }
}

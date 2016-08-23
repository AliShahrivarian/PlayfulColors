import VPlay 2.0
import QtQuick 2.0
import ".."

Item {

    id: gameOver

    signal btnRetryClicked
    signal btnBackToMenuClicked

    Rectangle {
        anchors.fill: parent
        color: "black"

        Text {
            id: txtGameOver
            color: "white"
            text: qsTr(GameInfo.langGameOver)
            anchors.centerIn: parent
        }
        Column {
            anchors.top: txtGameOver.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10
            MenuButton {
                id: btnRetry
                text: GameInfo.langRetry
                textColor: "black"
                color: "white"
                onClicked: gameOver.btnRetryClicked()
            }
            MenuButton {
                id: btnBackToMenu
                text: GameInfo.langBack
                textColor: "black"
                color: "white"
                onClicked: gameOver.btnBackToMenuClicked()
            }
        }
    }
}

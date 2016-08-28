import VPlay 2.0
import QtQuick 2.0
import ".."

Item {

    id: statusBar
    width: parent.width
    height: parent.height * 0.05

    property bool hasTimer: true

    signal btnBackPressed

    signal pointIncreasePressed
    signal pointDecreasePressed

    signal timeFinished
    signal resetTimerText

    signal pointReset

    onResetTimerText: {
        gameTimerText.text = qsTr(GameInfo.gameTimer.toString())
    }

    Rectangle {
        id: statusBarItemWrapper
        anchors.fill: parent
        radius: 20
        border.color: "white"
        border.width: 1

        gradient: Gradient {
            GradientStop {
                position: 0
                color: "purple"
            }
            GradientStop {
                position: 1
                color: "yellow"
            }
        }

        Text {
            id: playerPoints
            text: qsTr(GameInfo.point.toString())
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            color: "white"
            font.bold: true
        }

        Text {
            id: gameTimerText
            text: qsTr(GameInfo.gameTimer.toString())
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            color: "white"
            font.bold: true
            visible: statusBar.hasTimer
            Timer {
                id: gameTimer
                interval: 1000
                running: !GameInfo.gamePaused && statusBar.hasTimer
                triggeredOnStart: statusBar.hasTimer
                repeat: true
                onTriggered: {
                    if (GameInfo.gameTimer > 0) {
                        gameTimerText.text = (GameInfo.gameTimer -= 1)
                    } else {
                        gameTimer.stop()
                        timeFinished()
                    }
                }
            }
        }

        Rectangle {
            id: goBack
            opacity: 0.7
            color:"transparent"
            anchors.right: parent.right

            height: parent.height - 2
            width: parent.width / 4
            anchors.verticalCenter: parent.verticalCenter
            MenuButton {
                text: GameInfo.langBack
                textColor: "white"
                color: "red"
                border.color: "white"
                height: parent.height
                width: parent.width

                onClicked: {
                    statusBar.btnBackPressed()
                }
            }
        }

        //        Rectangle {
        //            id: goBack
        //            anchors.right: parent.right
        //            color: "white"
        //            border.color: "lime"
        //            border.width: 1
        //            radius: 10
        //            opacity: 0.7

        //            height: parent.height - 2
        //            anchors.verticalCenter: parent.verticalCenter

        //            width: parent.width / 4

        //            Text {
        //                id: goBackTxt
        //                text: qsTr(GameInfo.langBack)
        //                font.pixelSize: 10
        //                color: 'black'
        //                anchors.centerIn: parent
        //            }
        //            MouseArea {
        //                anchors.fill: parent
        //                onClicked: {
        //                    statusBar.btnBackPressed()
        //                }
        //            }
        //        }
    }

    Component.onCompleted: {
        changePoint(0)
    }

    onPointDecreasePressed: {
        changePoint(GameInfo.point -= 1)
    }
    onPointIncreasePressed: {
        changePoint(GameInfo.point += 1)
    }
    onPointReset: {
        changePoint(0)
    }
    function changePoint(point) {
        playerPoints.text = qsTr(GameInfo.langScore + ": ") + point
    }
}


import VPlay 2.0
import QtQuick 2.0
import ".."
Item {

    id: statusBar
    width: parent.width
    height: parent.height*0.05

    property bool hasTimer:true

    signal pointIncreasePressed()
    signal pointDecreasePressed()
    Rectangle{
        id:statusBarItemWrapper
        anchors.fill: parent
        radius: 20
        border.color: "white"
        border.width: 1

        gradient: Gradient{
            GradientStop{position: 0;color:"purple";}
            GradientStop{position: 1;color:"yellow";}
        }

        Text {
            id: playerPoints
            text: qsTr(GameInfo.point.toString())
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            color:"white"
            font.bold: true
        }

        Text {
            id: gameTimerText
            text: qsTr(GameInfo.gameTimer.toString())
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            color:"white"
            font.bold: true
            visible:statusBar.hasTimer
            Timer{
                id:gameTimer
                interval: 1000
                running: !GameInfo.gamePaused && statusBar.hasTimer
                triggeredOnStart: statusBar.hasTimer
                repeat: true
                onTriggered: {
                    if(GameInfo.gameTimer>0){
                        gameTimerText.text = (GameInfo.gameTimer-=1);
                    }else{
                        gameTimer.stop();
                        GameInfo.gamePaused = true;
                        GameInfo.gameOver = true;
                    }
                }
            }
        }
    }
    onPointDecreasePressed: {
        playerPoints.text = (GameInfo.point-=1);
    }
    onPointIncreasePressed: {
        playerPoints.text = (GameInfo.point+=1);
    }
}

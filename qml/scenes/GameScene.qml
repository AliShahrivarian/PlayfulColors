import VPlay 2.0
import QtQuick 2.0
import "../common"
import ".."
import "../levels"

SceneBase {

    id: gameScene

    // filename of the current level
    property string activeLevelFileName
    // currently loaded level
    property var activeLevel
    // countdown shown at level start
    property int countdown: 0
    property alias loader: loader

    // set the name of the current level, this will cause the Loader to load the corresponding level
    function setLevel(fileName) {
        activeLevelFileName = fileName
    }

    Connections{
        target: GameInfo
        onActiveLevelFileNameChanged:{
            activeLevelFileName = GameInfo.activeLevelFileName
        }
    }

    //     load levels at runtime
    Loader {
        id: loader
        source: activeLevelFileName ? "../levels/" + activeLevelFileName : ""
        anchors.fill: parent
        onLoaded: {
            // store the loaded level as activeLevel for easier access
            activeLevel = item
            // restarts the countdown
            countdown = 3
            GameInfo.gamePaused = true
            GameInfo.point = 0
            GameInfo.gameTimer = 60
        }
    }

    // text displays either the countdown or ""
    Rectangle {
        anchors.centerIn: parent
        color: "black"
        border.color: "White"
        border.width: 5
        Text {
            anchors.centerIn: parent
            color: "black"
            font.pixelSize: countdown > 0 ? 200 : 18
            font.bold: true
            text: countdown > 0 ? countdown : ""
            opacity: 1
        }
    }

    // if the countdown is greater than 0, this timer is triggered every second, decreasing the countdown (until it hits 0 again)
    Timer {
        repeat: true
        running: countdown > 0
        onTriggered: {
            countdown--
            if (countdown == 0)
                GameInfo.gamePaused = false
        }
    }
    onBackButtonPressed: {
        resetLevel()
    }

    function resetLevel() {
        activeLevelFileName = ""
        GameInfo.gameOver = false
        GameInfo.gamePaused = true
    }
}

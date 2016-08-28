import VPlay 2.0
import QtQuick 2.0
import ".."

Item {
    id: levelBaseScene
    anchors.fill: parent

    signal btnRetryClicked
    signal btnBackToLevelSelectClicked
    signal btnBackToMainMenuClicked
    signal gameOver
    signal isGameOverVisible(bool isVisible)
    signal prepareGameStart



    signal pointIncreasePressed()
    signal pointDecreasePressed()

    onPointDecreasePressed: {
        statusBar.pointDecreasePressed()
    }
    onPointIncreasePressed: {
        statusBar.pointIncreasePressed()
    }

    property bool hasTimer: false

    onPrepareGameStart: {
        GameInfo.gameOver = false
        countdown = 3
        GameInfo.gamePaused = true
        GameInfo.point = 0
        GameInfo.gameTimer = 60
        isGameOverVisible(false)
        statusBar.resetTimerText()
        statusBar.pointReset()
    }

    onBtnRetryClicked: {
        prepareGameStart()
    }

    onIsGameOverVisible: {
        gameOverTheme.visible = isVisible
    }

    onBtnBackToLevelSelectClicked: {
        window.state = "selectLevel"
        backBtnDuties()
    }

    onBtnBackToMainMenuClicked: {
        window.state = "menu"
        backBtnDuties()
    }

    function backBtnDuties() {
        GameInfo.activeLevelFileName = ""
        GameInfo.gameOver = false
        GameInfo.gamePaused = true
    }

    onGameOver: {
        GameInfo.lastGameScore = GameInfo.point
        GameInfo.lastGameTitle = GameInfo.activeLevelFileName
        GameInfo.gotScore = true
        GameInfo.gamePaused = true
        gameOverTheme.width = levelBaseScene.width
        gameOverTheme.height = levelBaseScene.height
        gameOverTheme.visible = true
    }


    StatusBar{
        id:statusBar
        hasTimer: levelBaseScene.hasTimer
        z:100000
        onTimeFinished: {
            if(levelBaseScene.hasTimer){
                levelBaseScene.gameOver()
            }
        }
        onBtnBackPressed: {
            levelBaseScene.btnBackToLevelSelectClicked()
        }
    }

    GameOver {
        id: gameOverTheme
        width: 0
        height: 0
        visible: false
        onBtnBackToMenuClicked: levelBaseScene.btnBackToMainMenuClicked()
        onBtnRetryClicked: levelBaseScene.btnRetryClicked()
        onBtnBackToLevelSelectClicked: levelBaseScene.btnBackToLevelSelectClicked()
        z: 100001
    }
}

import VPlay 2.0
import QtQuick 2.0
import "../common"
import ".."
import "../entities"

LevelBase {

    id: colorRainWithCloud

    signal btnRetryClicked
    signal btnBackToMainMenuClicked

    signal isGameOverVisible(bool isVisible)

    signal pointReset

    anchors.fill: parent

    PhysicsWorld {
        gravity.y: 0.5
        debugDrawVisible: false
    }

    Rectangle {
        color: "white"
        anchors.fill: parent
    }

    PointBar {
        id: pointBar
        z: 100000
    }

    ColorKeys {
        id: colorKeys
        anchors.bottom: parent.bottom
        onColorKeyPressed: {
            //    colorGrid.colorMatchPressed(selectedColor);
            var rainColor = GameInfo.rainedColors.shift()
            if (rainColor && !GameInfo.gamePaused)
                if (rainColor.color == selectedColor) {
                    rainColor.item.removeEntity()
                    pointBar.pointIncreasePressed()
                } else {
                    gameOver()
                }
        }
    }

//    CloudBase{
//        id:cloudBase
//        anchors.top:parent.top
//        width: parent.width
//        height: parent.height*0.3
//        anchors.left: parent.left
//    }

    ColorRainBase {
        id: colorRainBase
        anchors.bottom: colorKeys.top
        width: parent.width
        height: parent.height * 0.7
        anchors.left: parent.left
        onBottomWallHitted: {
            gameOver()
        }
    }

    GameOver {
        id: gameOverTheme
        width: 0
        height: 0
        visible: false
        onBtnRetryClicked: colorRainWithCloud.btnRetryClicked()
        onBtnBackToMenuClicked: colorRainWithCloud.btnBackToMainMenuClicked()
        z: 100001
    }

    function gameOver() {
        GameInfo.scoreList.push(GameInfo.point);
        GameInfo.gamePaused = true
        gameOverTheme.width = colorRainWithCloud.width
        gameOverTheme.height = colorRainWithCloud.height
        colorRainWithCloud.isGameOverVisible(true)
        updateDBScoreList()
    }

    onIsGameOverVisible: {
        gameOverTheme.visible = isVisible
    }
    onPointReset: {
        pointBar.pointReset()
    }
}

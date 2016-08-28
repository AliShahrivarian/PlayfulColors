import VPlay 2.0
import QtQuick 2.0
import "../common"
import ".."
import "../entities"

LevelBase {

    id: colorRainWithCloud

    onBtnRetryClicked: {
        prepareGame();
    }

    anchors.fill: parent

    PhysicsWorld {
        gravity.y: 0.5
        debugDrawVisible: false
    }

    Rectangle {
        color: "white"
        anchors.fill: parent
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
                    //pointBar.pointIncreasePressed()
                    colorRainWithCloud.pointIncreasePressed()
                } else {
                    colorRainWithCloud.gameOver()
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

    function prepareGame() {
        GameInfo.rainedColors = []
    }

    ColorRainBase {
        id: colorRainBase
        anchors.bottom: colorKeys.top
        width: parent.width
        height: parent.height * 0.7
        anchors.left: parent.left
        onBottomWallHitted: {
          colorRainWithCloud.gameOver()
        }
    }
}

import VPlay 2.0
import QtQuick 2.0
import ".."
import "../common"

LevelBase {

    id: colorRoad
    hasTimer: false

    Rectangle {
        id: colorRoadBackground
        color: "grey"
        anchors.fill: colorRoad
    }

    onPrepareGameStart: {
        randomColorKeysChangeColor()
    }

    RoadBase{
        id:road
    }

    PhysicsWorld {
        id: colorRoadPhysics
        gravity.y: 0
        debugDrawVisible: false
        updatesPerSecondForPhysics: 60
        velocityIterations: 10
    }

    ColorRoadBase {
        id: colorRoadBase
        anchors.fill: parent
        onBottomWallHitted: {
            colorRoad.state = "stopGravity"
            colorRoad.gameOver();
        }
        onTopWallHitted: {
            colorRoadBase.opacity = 1
            colorRoad.state = "startGravity"
        }
        onCarHitted: {
            colorRoad.state = "stopGravity"
            colorRoad.gameOver();
        }
    }

    RandomColorKeys {
        id: randomColorKeys
        anchors.bottom: parent.bottom
        onCorrectKeyClicked: {
            colorRoad.pointIncreasePressed()
            randomColorKeysChangeColor()
        }
        onWrongKeyClicked: {
            colorRoad.state = "stopGravity"
            colorRoad.gameOver()
            colorRoadBase.reset()
        }
    }

    Component.onCompleted: {
        randomColorKeysChangeColor()
    }
    function randomColorKeysChangeColor() {
        randomColorKeys.changeColors()
        colorRoad.state = "startGravity"
        colorRoadBase.createColorWall(randomColorKeys.selectedColor)
    }

    states: [
        State {
            name: "sendWallToTop"
            PropertyChanges {
                target: colorRoadPhysics
                gravity: Qt.point(0, -20)
            }
        },
        State {
            name: "startGravity"
            PropertyChanges {
                target: colorRoadPhysics
                gravity: Qt.point(0, 5)
            }
            StateChangeScript{
                script: {
                    GameInfo.stopLevelAnimation = false
                }
            }
        },
        State {
            name: "stopGravity"
            PropertyChanges {
                target: colorRoadPhysics
                gravity: Qt.point(0, 0)
            }
            StateChangeScript{
                script: {
                    GameInfo.stopLevelAnimation = true
                }
            }
        }
    ]
}

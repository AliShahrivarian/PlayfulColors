
import VPlay 2.0
import QtQuick 2.0
import "../entities"

Item {

    id: colorRoadBase

    property EntityManager entManager: entityManager

   // property alias wallColor: colorWall.wallColor
   // property alias wallY:colorWall.y

    signal topWallHitted
    signal bottomWallHitted
    signal carHitted


    Wall {
        height: parent.height + 50
        anchors.right: parent.left
    }
    // right wall
    Wall {
        height: parent.height + 50
        anchors.left: parent.right
    }

    // ceiling
//    Wall {
//        id: topWall
//        width: parent.width
//        anchors {
//            top: parent.top
//            left: parent.left
//            topMargin: -(parent.height/7)
//        }
//        onContacted: {
//            colorRoadBase.topWallHitted()
//        }
//    }
    // ceiling
    Wall {
        id: bottomWall
        width: parent.width
        anchors {
            bottom: parent.bottom
            left: parent.left
            bottomMargin: parent.height/2
        }
        onContacted: {
            colorRoadBase.bottomWallHitted()
            reset()
        }
    }
//    ColorWall{
//        id:colorWall
//    }
    Car{
        id:car
        anchors.top:bottomWall.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        onCarHitted: {
            colorRoadBase.carHitted()
            reset()
        }
    }
    function reset() {
        colorRoadBase.entManager.removeEntitiesByFilter(["colorWall"])
    }

    function createColorWall(color) {
            reset()
            colorRoadBase.entManager.createEntityFromUrlWithProperties(
                        Qt.resolvedUrl("../entities/ColorWall.qml"),{"wallColor":color})
    }
}

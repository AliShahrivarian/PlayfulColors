import VPlay 2.0
import QtQuick 2.0
import ".."
import "../entities"

Item {

    id: colorRainBase

    property EntityManager entManager: entityManager

//    PhysicsWorld {
//        gravity.y: 0.5
//        debugDrawVisible: false
//    }

    Rectangle {
        color: "white"
        anchors.fill: parent
    }

    signal bottomWallHitted

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
    Wall {
        id: bottomWall
        width: parent.width
        anchors {
            bottom: parent.bottom
            left: parent.left
        }
        onContacted: {
            colorRainBase.bottomWallHitted()
        }
    }
    Rectangle {
        color: "black"
        anchors.fill: bottomWall
        anchors.bottom: bottomWall.bottom
    }

    Component.onCompleted: {
        start()
    }

    function start() {
        spawnRain.start()
    }

    // clear all baloons and reset properties to start values
    function reset() {
        colorRainBase.entManager.removeEntitiesByFilter(["colorRain"])
        //      balloons = 0
        //      time = 20
        //      infoText.text = "Loading balloons..."
    }

    // create balloons with short intervals in between, creating a nice animation at the start
    Timer {
        id: spawnRain
        interval: 1000 // milliseconds
        repeat: true
        onTriggered: {
            if (!GameInfo.gamePaused)
                colorRainBase.entManager.createEntityFromUrl(
                            Qt.resolvedUrl("../entities/ColorRain.qml"))
        }
    }
}

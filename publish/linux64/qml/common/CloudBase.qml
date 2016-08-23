import VPlay 2.0
import QtQuick 2.0
import ".."
import "../entities"

Item {
    id: cloudBase

    property EntityManager entManager: entityManager


    Rectangle {
        color: "white"
        anchors.fill: parent
    }
    Timer {
        id: spawnCloud
        interval: 1000 // milliseconds
        repeat: true
        onTriggered: {
            if (!GameInfo.gamePaused)
                cloudBase.entManager.createEntityFromUrl(
                            Qt.resolvedUrl("../entities/Cloud.qml"))
        }
    }

    Component.onCompleted: {
        start()
    }

    function start() {
        spawnCloud.start()
    }
}

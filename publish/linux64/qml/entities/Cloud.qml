
import VPlay 2.0
import QtQuick 2.0
import ".."

EntityBase{
    id:cloud

    entityType: "cloud"

    CircleCollider {
        categories: Circle.Category3
        collidesWith: Circle.Category10
        radius: cloudShape.width/2
        anchors.centerIn: parent
        // restitution is bounciness, balloons are quite bouncy
        fixture.onBeginContact: {
            this.parent.removeEntity();
            GameInfo.gameOver = true;
        }
        linearVelocity: Qt.point(0,0)
    }

    MultiResolutionImage {
        id: cloudShape
        width: parent.parent.width
        height: parent.parent.height
        source: "../../assets/img/cloud/cloud.png"
        anchors.centerIn: parent
    }

    Component.onCompleted: {
        x= cloud.parent.width - cloudShape.width
        y = 0;
    }
}

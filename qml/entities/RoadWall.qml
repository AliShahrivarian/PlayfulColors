
import VPlay 2.0
import QtQuick 2.0

EntityBase {
    id:roadWall
    entityType: "roadWall"
    // default width and height
    width: 1
    height: 1

    signal contacted

    // only collider since we want the wall to be invisible
    BoxCollider {
        categories: Box.Category13
        collidesWith: Circle.Category13
        anchors.fill: parent
        fixture.onBeginContact: {
            contacted();
        }
    }
}

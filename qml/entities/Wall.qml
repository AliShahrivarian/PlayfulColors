
import VPlay 2.0
import QtQuick 2.0

EntityBase {
    entityType: "wall"
    // default width and height
    width: 1
    height: 1

    signal contacted

    // only collider since we want the wall to be invisible
    BoxCollider {
        categories: Box.Category1
        collidesWith: Circle.Category1
        anchors.fill: parent
        bodyType: Body.Static // the body shouldn't move
        fixture.onBeginContact: {
            contacted();
        }
    }
}

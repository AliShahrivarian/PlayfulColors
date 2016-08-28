
import VPlay 2.0
import QtQuick 2.0
import ".."

EntityBase {

    id: colorWall

    entityType: "colorWall"

    property alias wallColor:colorWallShape.color

    width: parent.width*0.7
    height: parent.height*0.02


    visible: !GameInfo.gamePaused

    BoxCollider {
        categories: Box.Category9
        collidesWith: Box.Category8
        anchors.centerIn: parent
        height: colorWallShape.height
    }
    Rectangle{
        id:colorWallShape
        anchors.fill: parent
    }

    Component.onCompleted: {
        x = (colorWall.parent.width - colorWallShape.width)/2
        y = 0;
    }
}

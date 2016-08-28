
import VPlay 2.0
import QtQuick 2.0
import "../entities"

Item {
    id: road
    anchors.fill: parent
    anchors.horizontalCenter: parent.horizontalCenter

    RoadWall{
        id:roadWall

            width: parent.width
            anchors {
                top: parent.bottom
                left: parent.left
              topMargin: parent.height/6
            }
    }
    Repeater{
        anchors.fill: parent
        model:6
        Road{

        }
    }
}

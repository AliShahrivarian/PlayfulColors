
import VPlay 2.0
import QtQuick 2.0
import ".."

Item {

    id: animatedBackground
    anchors.fill: parent

    ColorRainBase{
        id:colorRainBase
        anchors.fill: parent
        entManager: entityManagerForAnime
    }

    Component.onCompleted: {
        GameInfo.showAnimation = true;
    }
}


import VPlay 2.0
import QtQuick 2.0
import ".."

Item {

    id: animatedBackground


    ColorGrid{
        id: menuBackground
        anchors.fill: parent
        Timer{
            interval: 500
            running: true
            triggeredOnStart: true
            repeat: true
            onTriggered: {
                menuBackground.changeColorPressed();
            }
        }
    }
}

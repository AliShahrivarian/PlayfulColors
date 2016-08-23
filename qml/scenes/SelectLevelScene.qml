import VPlay 2.0
import QtQuick 2.0
import "../common"
import ".."
// EMPTY SCENE

SceneBase {

    id:selectLevelScene

    // signal indicating that a level has been selected
    signal levelPressed(string selectedLevel)
    Rectangle{
        anchors.fill: parent
        color:"white"
        Column {
            anchors.centerIn: parent
            spacing: 10
            MenuButton{
                text:"Rain Weather"
                textColor:"white"
                color:"blue"
                onClicked: {
                    GameInfo.rainedColors = [];
                    levelPressed("ColorRainWithClouds.qml");
                }
            }
        }

    }
}

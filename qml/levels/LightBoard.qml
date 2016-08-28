
import VPlay 2.0
import QtQuick 2.0
import "../common"
import ".."

LevelBase {

    id: lightBoard
    anchors.fill: parent
    hasTimer: true

    Rectangle{
        anchors.fill: parent
        color:"white"
    }


    ColorKeys{
        id:colorKeys
        anchors.bottom: parent.bottom
        onColorKeyPressed: {
            colorGrid.colorMatchPressed(selectedColor);
        }
    }

    Rectangle{
        width: parent.width*0.9
        height: parent.height*0.6
        anchors.top: parent.top
        anchors.topMargin: parent.height*0.05
        anchors.left:parent.left
        anchors.leftMargin: parent.width*0.05
        border.width: parent.width*0.025
        border.color: "brown"
        color:"black"
        Rectangle{
            width:parent.width-(parent.border.width*2)
            height: parent.height-(parent.border.width*2)
            anchors.centerIn: parent
            color:parent.color
            ColorGrid{
                id:colorGrid
                anchors.top: parent.top
                width: parent.width
                height: parent.height
                gridSizePercentage: 0.1
                Component.onCompleted: {
                    colorGrid.changeColorPressed();
                }
                onColorMatched: {
                    lightBoard.pointIncreasePressed();
                    colorGrid.changeColorPressed();
                }
                onColorDismatched: {
                    lightBoard.pointDecreasePressed();
                }
            }
        }
    }
}


import VPlay 2.0
import QtQuick 2.0
import ".."

Item {

    id: colorKeys

    width: parent.width
    height: parent.height*0.3

    signal colorKeyPressed(string selectedColor)

    Rectangle{
        id:keysContainer
        anchors.bottom: parent.bottom
        anchors.right:parent.right
        anchors.left:parent.left
        width: parent.width
        height: parent.height
        color:"white"

        GridView{
            id:keysGrid
            anchors.fill: parent

            anchors.margins: parent.width*0.05

            clip:true

            model:GameInfo.colors
            delegate:keyDelegate


            cellWidth: keysGrid.width*0.33
            cellHeight: keysGrid.height*0.33

        }
    }

    Component{
        id:keyDelegate

        Item {
            width:keysGrid.cellWidth
            height: keysGrid.cellHeight

            ColorButton{
                color:GameInfo.colors[index]
                width:parent.width*0.9
                height:parent.height*0.9
                anchors.centerIn: parent
                onClicked:{
                    if(GameInfo.gamePaused)return;
                    colorKeys.colorKeyPressed(GameInfo.colors[index]);
                    this.opacity = 0;
                    this.opacity = 0.5;
                    this.opacity = 1;
                }
            }
        }
    }
}

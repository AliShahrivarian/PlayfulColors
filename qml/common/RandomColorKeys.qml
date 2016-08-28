
import VPlay 2.0
import QtQuick 2.0
import ".."

Item {

    id: randomColorKeys


    signal correctKeyClicked()
    signal wrongKeyClicked()
    signal changeColors()

    width: parent.width
    height: parent.height*0.3


    Rectangle{
        id:keysContainer
        anchors.bottom: parent.bottom
        anchors.right:parent.right
        anchors.left:parent.left
        width: parent.width
        height: parent.height

        color:"transparent"

        GridView{
            id:keysGrid
            anchors.fill: parent

            anchors.margins: parent.width*0.05

            clip:true

            delegate:keyDelegate

            cellWidth: keysGrid.width*0.33
            cellHeight: keysGrid.height*0.33

        }
    }

    property var currentColors:[]
    property string selectedColor:""
    Component{
        id:keyDelegate


        Item {
            width:keysGrid.cellWidth
            height: keysGrid.cellHeight

            ColorButton{
                color:randomColorKeys.currentColors[index]
                width:parent.width*0.9
                height:parent.height*0.9
                anchors.centerIn: parent
                onClicked:{
                    if(GameInfo.gamePaused)return;
                    if(randomColorKeys.currentColors[index] == randomColorKeys.selectedColor)
                        randomColorKeys.correctKeyClicked();
                    else
                        randomColorKeys.wrongKeyClicked();
                    this.opacity = 0;
                    this.opacity = 0.5;
                    this.opacity = 1;
                }
            }
        }
    }

    onChangeColors: {
        var newColors = [];
        while(true){
            var newColor = GameInfo.colors[Math.floor(Math.random()*GameInfo.colors.length)]
            if(newColors.indexOf(newColor)==-1)
                newColors.push(newColor);
            if(newColors.length==3)break;
        }
        randomColorKeys.currentColors = newColors;
        randomColorKeys.selectedColor = randomColorKeys.currentColors[Math.floor(Math.random()*randomColorKeys.currentColors.length)]
        keysGrid.model = randomColorKeys.currentColors;
    }
}

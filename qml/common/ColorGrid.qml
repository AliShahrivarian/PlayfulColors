
import VPlay 2.0
import QtQuick 2.0
import ".."

Item {

    id: colorGrid

    signal colorChanged(color selectedColor)
    signal wrongColorPressed()
    signal correctColorPressed()

    signal changeColorPressed()

    signal colorMatchPressed(string selectedColor)

    signal colorMatched()
    signal colorDismatched()
    property alias gridSizePercentage:thisGrid.gridSizePerc

    Grid{
        id:thisGrid

        property int activeIndex:-1;
        property string selectedColor:"black"
        property double gridSizePerc:0.05
        property double repeaterSizePerc:thisGrid.gridSizePerc- 0.001


        anchors.fill: parent

        rows: Math.ceil(parent.height/(parent.height*thisGrid.gridSizePerc))
        columns:Math.ceil(parent.width/(parent.width*thisGrid.gridSizePerc))
        rowSpacing: parent.height*0.001
        columnSpacing: parent.width*0.001

        Repeater{
            model:thisGrid.rows * thisGrid.columns

            Rectangle{
                property int thisIndx:index
                property string thisColorName :""
                width: parent.width*thisGrid.repeaterSizePerc
                height: parent.height*thisGrid.repeaterSizePerc
                radius: 5
                opacity: thisGrid.activeIndex == index? 1:0.4
                border.width: parent.width*0.005
                border.color: "white"
                //color:menuScene.backColors[Math.round((Math.random()*100)%5)]
                Component.onCompleted: {
                    this.thisColorName = GameInfo.colors[Math.floor((Math.random()*GameInfo.colors.length))];
                    this.color = this.thisColorName;
                }
                onOpacityChanged: {
                    if(this.opacity == 1){
                        colorGrid.colorChanged(this.thisColorName);
                        thisGrid.selectedColor = this.thisColorName;
                    }
                }
//                MouseArea{
//                    anchors.fill: parent
//                    onClicked: {
//                        if(parent.opacity == 1){
//                            colorGrid.correctColorPressed();
//                            colorGrid.changeColorPressed();
//                        }else{
//                            colorGrid.wrongColorPressed();
//                        }
//                    }
//                }
            }
        }
    }

    onChangeColorPressed:  {
        thisGrid.activeIndex = Math.floor(Math.random()*(thisGrid.rows * thisGrid.columns));
    }
    onColorMatchPressed: {
        if( selectedColor == thisGrid.selectedColor)
            colorGrid.colorMatched();
        else
            colorGrid.colorDismatched();
    }
}

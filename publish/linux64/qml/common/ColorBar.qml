
import VPlay 2.0
import QtQuick 2.0
import ".."

Rectangle {

    id: colorBar

    signal colorChangePressed(color newColor)

    onColorChangePressed: {
        if(GameInfo.gamePaused)return;
        loader.gradcolor=newColor;
        loader.dynamicWidth +=10;
    }

    radius: 20
    anchors.top:parent.top
    anchors.margins: 5
    anchors.horizontalCenter: parent.horizontalCenter
    width: parent.width*0.8
    height: parent.height*0.04
    color:"white"
    border.color: "black"
    border.width: 2

    Rectangle{
        id:loader
        property color gradcolor: "white"
        property double dynamicWidth: colorBar.width*0.3
        anchors.left:colorBar.left
        anchors.top:colorBar.top
        anchors.bottom: colorBar.bottom
        anchors.margins: 3
        anchors.verticalCenter: parent.verticalCenter
        radius:colorBar.radius
        width:loader.dynamicWidth
        gradient: Gradient{
            GradientStop{position: 0;color:loader.gradcolor;}
            GradientStop{position: 1;color:"black";}
        }
    }

    Timer {
        interval: 500
        running:!GameInfo.gamePaused
        triggeredOnStart: true
        repeat: true
        onTriggered: {
            if(GameInfo.gamePaused)return;
            if(loader.dynamicWidth>0){
                loader.dynamicWidth-=4;
            }
        }
    }
}

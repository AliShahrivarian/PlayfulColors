
import VPlay 2.0
import QtQuick 2.0
import ".."

EntityBase {

    id: colorRain

    entityType: "colorRain"

    visible: !GameInfo.gamePaused || GameInfo.showAnimation

    onVisibleChanged: {
        if(GameInfo.gamePaused && !GameInfo.showAnimation)
            colorRain.removeEntity();
    }



    property string rainColor:GameInfo.colors[Math.floor((Math.random()*100)%GameInfo.colors.length)];

    CircleCollider {
        categories: Circle.Category1
        collidesWith: Box.Category1
        radius: colorRainShape.width/2
        anchors.centerIn: parent
        // restitution is bounciness, balloons are quite bouncy
        fixture.onBeginContact: {
            this.parent.removeEntity();
            GameInfo.gameOver = true;
        }
    }
    MultiResolutionImage {
        id: colorRainShape
        width: parent.parent.width*0.03
        height: parent.parent.height*0.05
        source: "../../assets/img/rain/"+colorRain.rainColor +".png"
        anchors.centerIn: parent
    }
    //    Rectangle{
    //        id:colorRainShape

    //        anchors.centerIn:  parent
    //        width: parent.parent.width*0.03
    //        height: parent.parent .height*0.05
    //        color:GameInfo.colors[Math.floor((Math.random()*100)%GameInfo.colors.length)]
    //    }


    Component.onCompleted: {
        x = utils.generateRandomValueBetween( 15,colorRain.parent.width-15);
        y = 0;
        if(!GameInfo.gamePaused && !GameInfo.showAnimation){
            GameInfo.rainedColors.push({item:colorRain,color: colorRain.rainColor});
        }
    }

}

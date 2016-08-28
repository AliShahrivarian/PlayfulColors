
import VPlay 2.0
import QtQuick 2.0
import ".."

EntityBase {
    id: road

    entityType: "road"

    width: parent.width
    height: parent.height/5
    anchors.horizontalCenter: parent.horizontalCenter

    Image{
        anchors.fill: parent
        source: "../../assets/img/road/road.png"
    }

    BoxCollider{
        categories: Circle.Category13
        collidesWith: Box.Category13
        anchors.fill: parent
        // restitution is bounciness, balloons are quite bouncy
        fixture.onBeginContact: {
           this.parent.y = -this.parent.height*2
        }
        gravityScale: 0
    }

    // platform movement
    MovementAnimation {
      id: movement
      target: road // which object will be affected
      property: "y" // which property will be affected
      running: true // move only when the frog is jumping over the limit
      velocity: 140
    }
    Connections{
        target:GameInfo
        onStopLevelAnimationChanged:{
            if(GameInfo.stopLevelAnimation==true){
                movement.stop()
            }else{
                movement.start()
            }
        }
    }

//    // wobble animation
//    ScaleAnimator {
//      id: wobbleAnimation
//      target: road
//      running: false // default is false and it gets activated on every collision
//      from: 0.9
//      to: 1
//      duration: 1000
//      easing.type: Easing.OutElastic // Easing used get an elastic wobbling instead of a linear scale change
//    }
}

import VPlay 2.0
import QtQuick 2.0

EntityBase {

    id: car

    entityType: "car"



    width: parent.width * 0.25
    height: parent.height * 0.4

    signal carHitted


    BoxCollider {
        categories: Box.Category8
        collidesWith: Box.Category9
        anchors.horizontalCenter: parent.horizontalCenter
        width: carBody.width
        height: 1
        anchors.top: carBody.top
        fixture.onBeginContact: {
            car.carHitted()
        }
    }

    Rectangle{
        id:rightTopWheel
        color:"black"
        border.width: 1
        border.color:"white"
        radius: 5
        anchors.right:carBody.right
        anchors.top:carBody.top
        anchors.rightMargin: -width * 0.2
        anchors.topMargin: 5
        width: carBody.width * 0.2
        height: carBody.height * 0.2
    }
    Rectangle{
        id:rightBottomWheel
        color:"black"
        border.width: 1
        border.color:"white"
        radius: 5
        anchors.right:carBody.right
        anchors.bottom:carBody.bottom
        anchors.rightMargin: -width * 0.2
        anchors.bottomMargin: 5
        width: carBody.width * 0.2
        height: carBody.height * 0.2
    }
    Rectangle{
        id:leftTopWheel
        color:"black"
        border.width: 1
        border.color:"white"
        radius: 5
        anchors.left:carBody.left
        anchors.top:carBody.top
        anchors.leftMargin: -width * 0.2
        anchors.topMargin: 5
        width: carBody.width * 0.2
        height: carBody.height * 0.2
    }
    Rectangle{
        id:leftBottomWheel
        color:"black"
        border.width: 1
        border.color:"white"
        radius: 5
        anchors.left:carBody.left
        anchors.bottom:carBody.bottom
        anchors.leftMargin: -width * 0.2
        anchors.bottomMargin: 5
        width: carBody.width * 0.2
        height: carBody.height * 0.2
    }

    Rectangle{
        id:carBody
        color:"red"
        anchors.fill: parent
        border.width: 1
        border.color: "black"
        radius: 10

        Rectangle{
            id:frontBody
            width: parent.width * 0.9
            height: parent.height * 0.27
            anchors.topMargin: parent.height * 0.03
            anchors.top:parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            border.width: 1
            border.color: "black"
        }
        Rectangle{
            id:roof
            width: parent.width * 0.95
            height: parent.height * 0.55
            anchors.top:frontBody.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            border.width: 1
            border.color: "white"
            color:"black"
          //  radius: 8
        }

        Rectangle{

            id:backBody
            width: parent.width * 0.9
            height: parent.height * 0.15
            anchors.bottom:parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            border.width: 1
            border.color: "black"
        }
        Rectangle{
            id:spoilerBody
            anchors.bottom: backBody.bottom
            anchors.bottomMargin: backBody.height * 0.1
            anchors.horizontalCenter: parent.horizontalCenter
            color:"red"
            radius: 15
            width: backBody.width * 0.9
            height: backBody.height * 0.7
            Rectangle{
                id:spoilerCover
                width: parent.width
                height: parent.height * 0.8
                color:"white"
                radius: 15
                anchors.bottomMargin: parent.height*0.2
            }
        }

//        Rectangle{
//            id:bodyPaint
//            color:"yellow"
//            width: parent.width * 0.15
//            height: parent.height
//            anchors.horizontalCenter: parent.horizontalCenter
//        }
        Rectangle{
            id:frontWindow
            width: roof.width
            height: roof.height * 0.2
            anchors.top:roof.top
            anchors.horizontalCenter: roof.horizontalCenter
            color:"grey"
            opacity: 0.7
           // radius: roof.radius
        }

        Rectangle{
            id:backWindow
            width: roof.width
            height: roof.height * 0.1
            anchors.bottom:roof.bottom
            anchors.horizontalCenter: roof.horizontalCenter
            color:"grey"
            opacity: 0.7
           // radius: roof.radius
        }
    }


}

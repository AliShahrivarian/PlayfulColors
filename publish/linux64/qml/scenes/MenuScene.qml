import VPlay 2.0
import QtQuick 2.0
import "../common"
import ".."

SceneBase {
    id: menuScene

    signal playPressed
    signal scorePressed
    // signal indicating that the selectLevelScene should be displayed
    signal selectLevelPressed
    // signal indicating that the creditsScene should be displayed
    signal creditsPressed

    signal exitPressed

    // background
    Rectangle {
        anchors.fill: parent.gameWindowAnchorItem
        color: "white"
    }
    //        Image {
    //            id: back
    //            source: "../../assets/colorRain.png"
    //            anchors.fill: parent
    //        }
//    AnimatedBackground{
//        id:animatedBackground
//        anchors.fill:parent
//    }


    // the "logo"
    /*
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            y: 30
            font.pixelSize: 30
            color: "#e9e9e9"
            text: "Color Dance"
        }*/

    // menu
    Column {
        anchors.centerIn: parent
        spacing: 10
        z:100
        MenuButton {
            text: GameInfo.langPlay
            color: "white"
            onClicked: {
                GameInfo.showAnimation = false;
                playPressed()
            }
        }
//        MenuButton{
//            text: GameInfo.langScore
//            color:"white"
//            onClicked: {
//                scorePressed()
//            }
//        }

        MenuButton{
            text:GameInfo.langLanguage
            color:"white"
            property bool isEn : true
            onClicked: {
                this.isEn = !this.isEn

                if (this.isEn) {
                    GameInfo.langBack = "Back"
                    GameInfo.langExit = "Exit"
                    GameInfo.langHelp = "Help"
                    GameInfo.langPlay = "Play"
                    GameInfo.langRetry = "Retry"
                    GameInfo.langScore = "Score"
                    GameInfo.langLanguage = "Language: EN"
                    GameInfo.langContact = "Contact me"
                    GameInfo.langGameOver = "!Game Over!"
                } else {
                    GameInfo.langBack = "بازگشت"
                    GameInfo.langExit = "خروج"
                    GameInfo.langHelp = "راهنما"
                    GameInfo.langPlay = "شروع"
                    GameInfo.langRetry = "شروع مجدد"
                    GameInfo.langScore = "امتیاز"
                    GameInfo.langLanguage = "زبان: فارسی"
                    GameInfo.langContact= "ارتباط با ما"
                    GameInfo.langGameOver = "!باختید!"
                }
            }
        }

        MenuButton{
            text:GameInfo.langContact
            color:"white"
            onClicked: creditsPressed()
        }

        MenuButton {
            text: GameInfo.langExit
            color:"white"
            onClicked: exitPressed()
        }
    }
    Component.onCompleted: {
        GameInfo.showAnimation=true;
    }

    // a little V-Play logo is always nice to have, right?
    //        Image {
    //            source: "../../assets/img/vplay-logo.png"
    //            width: 60
    //            height: 60
    //            anchors.right: menuScene.gameWindowAnchorItem.right
    //            anchors.rightMargin: 10
    //            anchors.bottom: menuScene.gameWindowAnchorItem.bottom
    //            anchors.bottomMargin: 10
    //        }
}

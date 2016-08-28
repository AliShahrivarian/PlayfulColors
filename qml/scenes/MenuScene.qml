import VPlay 2.0
import QtQuick 2.0
import "../common"
import ".."

SceneBase {
    id: menuScene

    signal playPressed
    signal showLeaderBoardPressed
    signal showHelpMenuPressed
    // signal indicating that the selectLevelScene should be displayed
    signal selectLevelPressed
    // signal indicating that the creditsScene should be displayed
    signal creditsPressed

    signal exitPressed

    // background
    Rectangle {
        anchors.fill: parent.gameWindowAnchorItem
        color: "black"
    }


    AnimatedBackground{
        id:animatedBackground
        anchors.fill: parent
    }

    Column {
        anchors.centerIn: parent
        spacing: 10
        width: parent.width*0.7
        z:100
        MenuButton {
            text: GameInfo.langPlay
            color: "white"
            width: parent.width
            onClicked: {
                GameInfo.showAnimation = false;
                playPressed()
            }
        }
        MenuButton{
            text: GameInfo.langLeaderBoard
            color:"white"
            width: parent.width
            onClicked: {
                showLeaderBoardPressed()
            }
        }
        MenuButton{
            text: GameInfo.langHelp
            color:"white"
            width: parent.width
            onClicked: {
                showHelpMenuPressed()
            }
        }

        MenuButton{
            text:GameInfo.langLanguage
            color:"white"
            width: parent.width
            property bool isEn : true
            onClicked: {
                this.isEn = !this.isEn

                if (this.isEn) {
                    GameInfo.currentLanguage = "EN"
                    GameInfo.langBack = "Back"
                    GameInfo.langExit = "Exit"
                    GameInfo.langHelp = "Help"
                    GameInfo.langPlay = "Play"
                    GameInfo.langRetry = "Retry"
                    GameInfo.langLeaderBoard = "Show Leaderboard"
                    GameInfo.langScore = "Score"
                    GameInfo.langLanguage = "Language: FA"
                    GameInfo.langContact = "Contact me"
                    GameInfo.langGameOver = "!Game Over!"
                    GameInfo.langLevelSelect = "Select Level"
                } else {
                    GameInfo.currentLanguage = "FA"
                    GameInfo.langBack = "بازگشت"
                    GameInfo.langExit = "خروج"
                    GameInfo.langHelp = "راهنما"
                    GameInfo.langPlay = "شروع"
                    GameInfo.langRetry = "شروع مجدد"
                    GameInfo.langScore = "امتیاز"
                    GameInfo.langLeaderBoard = "امتیازات"
                    GameInfo.langLanguage = "زبان: EN"
                    GameInfo.langContact= "ارتباط با ما"
                    GameInfo.langGameOver = "!باختید!"
                    GameInfo.langLevelSelect = "انتخاب مرحله"
                }
            }
        }

        MenuButton{
            text:GameInfo.langContact
            color:"white"
            width: parent.width
            onClicked: creditsPressed()
        }

        MenuButton {
            text: GameInfo.langExit
            color:"white"
            width: parent.width
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

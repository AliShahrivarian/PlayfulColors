pragma Singleton
import QtQuick 2.0
import VPlay 2.0

QtObject {

    id: gameInfo

    property bool showAnimation:false
    property bool gameOver:false
    property bool gamePaused:true

    property bool easyMode:true
    property bool normalMode:false
    property bool hardMode:false


    property int gameTimer:60

    property var colors:["blue","green","red","magenta","purple","orange","lime","wheat","teal"]

    property int totalPoint:0
    property int point:0
    property var scoreList: []

    onScoreListChanged: {
    }

    property var rainedColors:[]

    property string selectedGame

    property string langPlay:"Play"
    property string langHelp:"Help"
    property string langExit:"Exit"
    property string langRetry:"Retry"
    property string langBack:"Back"
    property string langScore:"Score"
    property string langLanguage:"Language: En"
    property string langCredit: "Credits"
    property string langContact:"Contact me"
    property string langGameOver:"Game Over"
}

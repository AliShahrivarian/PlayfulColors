pragma Singleton
import QtQuick 2.0
import VPlay 2.0

QtObject {

    id: gameInfo


    property string activeLevelFileName: ""

    property bool stopLevelAnimation:false

    property bool showAnimation:false
    property bool gameOver:false
    property bool gamePaused:true

    property string lastGameTitle:""
    property int lastGameScore:0
    property bool gotScore:false
    signal addNewScore

    property bool easyMode:true
    property bool normalMode:false
    property bool hardMode:false


    property int gameTimer:60

    property var colors:["blue","green","red","magenta","purple","orange","lime","wheat","teal"]

    property int totalPoint:0
    property int point:0


    property var rainedColors:[]

    property string currentLanguage:"EN"
    property string langPlay:"Play"
    property string langHelp:"Help"
    property string langExit:"Exit"
    property string langRetry:"Retry"
    property string langLevelSelect:"Select Level"
    property string langBack:"Back"
    property string langScore: "Score"
    property string langLeaderBoard:"Show Leaderboard"
    property string langLanguage:"Language: FA"
    property string langCredit: "Credits"
    property string langContact:"Contact me"
    property string langGameOver:"Game Over"
}

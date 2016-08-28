import VPlay 2.0
import QtQuick 2.0
import "../"
import "../common"

Item {

    id: playfulcolorsGameNetwork

    signal addedScore

    VPlayGameNetwork {
        id: gameNetwork
        gameId: 295 // create your own gameId in the Web Dashboard
        secret: "66D91C2D-69AB-4C4A-979F-5C6986D12192"
        gameNetworkView: gameNetworkUI // we use the id of our view below
        clearAllUserDataAtStartup: true
    }

    Rectangle{
        anchors.fill: parent
        color:"white"
    }

    Column {
        anchors.centerIn: parent
        spacing: 10
        MenuButton {
            text: "Color Road"
            color: "white"
            textColor: "black"
            border.color: "lime"
            onClicked: gameNetwork.showLeaderboard("ColorRoad") // open leaderboard view
        }
        MenuButton {
            text: "Light Board"
            color: "white"
            textColor: "black"
            border.color: "lime"
            onClicked: gameNetwork.showLeaderboard("LightBoard") // open leaderboard view
        }
        MenuButton {
            text: "Rain Drops"
            color: "white"
            textColor: "black"
            border.color: "lime"
            onClicked: gameNetwork.showLeaderboard("RainDrops") // open leaderboard view
        }
        MenuButton{
            text: GameInfo.langBack
            color: "red"
            textColor: "white"
            border.color: "lime"
            onClicked: playfulcolorsGameNetwork.parent.parent.backButtonPressed()
        }
    }

    VPlayGameNetworkView {
        // adds the default game network UI
        id: gameNetworkUI
        visible: false
        onShowCalled: visible = true
        onBackClicked: visible = false
    }


    onAddedScore:  {
        if (GameInfo.gotScore == true) {
            if (GameInfo.lastGameScore != 0) {
                switch (GameInfo.lastGameTitle) {
                case "ColorRoad.qml":
                    gameNetwork.reportScore(GameInfo.lastGameScore,
                                            "ColorRoad")
                    break
                case "ColorRainWithClouds.qml":
                    gameNetwork.reportScore(GameInfo.lastGameScore,
                                            "RainDrops")
                    break
                case "LightBoard.qml":
                    gameNetwork.reportScore(GameInfo.lastGameScore,
                                            "LightBoard")
                    break
                }
                GameInfo.lastGameScore = 0
                GameInfo.lastGameTitle = ""
            }
        }
    }
}

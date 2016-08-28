import VPlay 2.0
import QtQuick 2.0
import "../common"
import "../"

 SceneBase{

    id: networkQmlLoader

    onBackButtonPressed: {
        networkQmlLoaderBackBtn.visible = true
    }

    MenuButton{
        id:networkQmlLoaderBackBtn
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        text: GameInfo.langBack
        color: "red"
        border.color: "White"
        onClicked: backButtonPressed()
    }

    Loader {
        id: loader
       // source:  "NetworkImpl.qml"
        anchors.fill: parent
        onLoaded: {
            networkQmlLoaderBackBtn.visible=false
        }
    }

    Connections{
        target:GameInfo
        onGotScoreChanged:{
            if(loader.item && loader.item.addedScore)
                loader.item.addedScore()
        }
    }
}

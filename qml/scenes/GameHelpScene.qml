
import VPlay 2.0
import QtQuick 2.0
import ".."
import "../common"

SceneBase {

    id: gameHelpScene

    property string activeHelpFileName:""

    Rectangle{
        anchors.fill: parent
        color:"white"
        Column {
            anchors.centerIn: parent
            spacing: 10
            MenuButton {
                text: "Color Road"
                textColor: "white"
                color: "blue"
                onClicked: {
                    activeHelpFileName = "ColorRoadHelp.qml"
                }
            }
            MenuButton {
                text: "Light Board"
                textColor: "white"
                color: "blue"
                onClicked: {
                    activeHelpFileName = "LightBoardHelp.qml"
                }
            }
            MenuButton{
                text:"Rain Drops"
                textColor:"white"
                color:"blue"
                onClicked: {
                    activeHelpFileName = "ColorRainWithCloudsHelp.qml"
                }
            }
            MenuButton{
                text:GameInfo.langBack
                textColor:"white"
                color:"red"
                onClicked: {
                    backButtonPressed()
                }
            }
        }

    }

    Loader {
        id: loader
        source: activeHelpFileName ? "../helps/" + activeHelpFileName : ""
        anchors.fill: parent
        visible:false
        onLoaded: {
            loader.visible = true;
        }
    }

    Connections{
        target: loader.item
        onBtnBackPressed:{
            gameHelpScene.activeHelpFileName = ""
        }
    }

}

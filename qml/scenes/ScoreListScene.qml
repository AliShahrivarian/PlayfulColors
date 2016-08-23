import VPlay 2.0
import QtQuick 2.0
import "../common"
import ".."

SceneBase{
    id:scoreListScene

    Column{
        id: scoreListColumn

        anchors.centerIn: parent
        width: parent.width*0.5


        spacing: 10

        Repeater{
            model: GameInfo.scoreList

            Rectangle{
                width: scoreListColumn.width
                height: 20
                Text {
                    text: qsTr(model)
                    font.pixelSize: 10
                }
            }
        }
    }
}

import VPlay 2.0
import QtQuick 2.0
import ".."

Item {

    id: pointBar

    signal pointIncreasePressed
    signal pointDecreasePressed
    signal pointReset

    property alias color: background.color

    anchors.top:parent.top
    width: parent.width
    height: playerPoints.height + 4

    Rectangle {
        id: background
        anchors.fill: parent
        border.width: 0.5
        border.color: "black"
        color: "#5353ff"
    }

    Text {
        id: playerPoints
        text: qsTr(GameInfo.point.toString())
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        color: "white"
    }

    onPointDecreasePressed: {
        playerPoints.text = qsTr(GameInfo.langScore + ": ") + (GameInfo.point -= 1)
    }
    onPointIncreasePressed: {
        playerPoints.text = qsTr(GameInfo.langScore + ": ") + (GameInfo.point += 1)
    }
    onPointReset: {
        playerPoints.text = qsTr(GameInfo.langScore + ": ") +(GameInfo.point = 0)
    }
}


import VPlay 2.0
import QtQuick 2.0

Rectangle {

    id: colorButton

    signal clicked

    border.width: 1
    radius: 10
    border.color: "black"

    MouseArea{
        id:colorHitterMouseArea
        hoverEnabled: true
        anchors.fill: parent
        onClicked: colorButton.clicked()
        onPressed: colorButton.opacity = 0.5
        onReleased: colorButton.opacity = 1
    }

}

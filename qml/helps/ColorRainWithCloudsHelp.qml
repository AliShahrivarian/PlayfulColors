
import VPlay 2.0
import QtQuick 2.0
import ".."
import "../common"

HelpBase {

    id: colorRainWithCloudsHelp

    property string helpTxt:GameInfo.currentLanguage == "EN"?
                                "In this level you have 9 colored keys on the bottom of page.
The weather is rainy but instead of rain drops, color drops are falling from the sky.
Watch them and don't let them to touch the ground. Something awful is behind this."
                              :
                                "در این مرحله شما ۹ دکمه رنگی در پایین صفحه دارید.
هوا بارانی است اما به جای قطرات باران، قطرات رنگ از آسمان می بارد. مراقب آنها باشید و نگذارید به زمین برخورد کنند."

    Text {
        id: help
        text: qsTr(colorRainWithCloudsHelp.helpTxt)
        wrapMode: Text.Wrap
        anchors.fill: parent
        anchors.margins: 30
        anchors.centerIn: parent
    }

}

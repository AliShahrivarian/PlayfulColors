
import VPlay 2.0
import QtQuick 2.0
import ".."
import "../common"

HelpBase {

    id: lightBoardHelp

    property string helpTxt:GameInfo.currentLanguage == "EN"?
                                "In this level you have 9 colored keys on the bottom of page and board of colors in top of the colored keys.
Your duty is to tap on the same colored keys as the turned on color on the board.
You have 60 seconds; Hurry!!!"
                              :
                                "در این مرحله شما ۹ دکمه رنگی در پایین صفحه و یک تخته رنگی در بالای دکمه های دارید.
وظیفه شما انتخاب دکمه همرنگ با رنگ روشن شده بر روی تخته می باشد. شما فقط ۶۰ ثانیه زمان دارید، عجله کنید!!!"

    Text {
        id: help
        text: qsTr(lightBoardHelp.helpTxt)
        wrapMode: Text.Wrap
        anchors.fill: parent
        anchors.margins: 30
        anchors.centerIn: parent
    }

}

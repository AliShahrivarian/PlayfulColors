
import VPlay 2.0
import QtQuick 2.0
import ".."
import "../common"

HelpBase {

    id: lightBoardHelp

    property string helpTxt:GameInfo.currentLanguage == "EN"?
                                "You are going to vacation but something is wrong today. The are a lot of wall in road.
Be aware of them and don't hit them.
There will be 3 colored keys under your car. Press same colored key as colored wall to destroy them."
                              :
                                "شما در حال سفر هستید اما امروز اوضاع عجیب است. تعداد زیادی دیوار در جاده است. مراقب باشید  تا به آنها برخورد نکنید.
سه کلید رنگی زیر خودروی شما قرار دارد. کلید همرنگ با دیوار را انتخاب کنید تا دیوار را نابود کنید."

    Text {
        id: help
        text: qsTr(lightBoardHelp.helpTxt)
        wrapMode: Text.Wrap
        anchors.fill: parent
        anchors.margins: 30
        anchors.centerIn: parent
    }

}

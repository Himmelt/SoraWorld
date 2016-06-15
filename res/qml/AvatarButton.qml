import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0


Item {
    id: avatarButton
    property bool isOnline: false
    property double side: Math.min(width,height)
    property url avatarImg
    signal avatarclick()
    signal stateclick()

    Button {
        id: avatar
        width: side
        height: width

        background: RoundImage {
            anchors.fill: parent
            radius: width/2
            source: avatarImg
            border_width: 1
            border_color: "white"
        }

        onClicked: avatarclick()
    }

    Button {
        id: state
        x: side*0.7071
        width: side*0.2929
        height: width

        background:RoundImage {
            anchors.fill: parent
            radius: width/2
            source: "qrc:/img/svg/" + (isOnline ? "online.svg" : "offline.svg")
        }

        onClicked: stateclick()
    }
}

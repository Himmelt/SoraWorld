import QtQuick 2.7
import QtQuick.Controls 2.0

TabButton{
    id: root
    width: 50
    height: 50

//    property int index: 0
    property bool isOnline: false
    property url avatarImg: "qrc:/img/avatar/avatar.png"

    signal stateclick

    background: RoundImage{
        id: avatar
        anchors.fill: root
        source: avatarImg
        border_width: 1.5

        Button{
            id: state
            anchors.top: avatar.top
            anchors.right: avatar.right
            width: avatar.width/3
            height: avatar.height/3
            hoverEnabled: true

            background:RoundImage {
                source: "qrc:/img/svg/" + (state.hovered ? (state.down ? "xxx_3.svg" : "xxx_2.svg") : (isOnline ? "online.svg" : "offline.svg"))
            }
            onClicked: stateclick()
        }
    }
}

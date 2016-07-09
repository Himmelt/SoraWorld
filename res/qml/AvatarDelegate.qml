import QtQuick 2.7
import QtQuick.Controls 2.0

Button{
    id: root
    width: 50
    height:50

    property alias source: avatar.source
    property alias border: avatar.border
    property bool isOnline: false
    signal stateClicked

    background: RoundImage{
        id: avatar
        source: "qrc:/img/avatar/default.png"
        anchors.fill: root
        border.width: 1

        Button{
            id: state
            anchors.top: avatar.top
            anchors.right: avatar.right
            width: avatar.width/3
            height: avatar.height/3
            hoverEnabled: true

            background: RoundImage {
                anchors.fill: state
                source: "qrc:/img/svg/" + (state.hovered ? (state.down ? "xxx_3.svg" : "xxx_2.svg") : (root.isOnline ? "online.svg" : "offline.svg"))
            }
            onClicked: stateClicked()
        }
    }
}

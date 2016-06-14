import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

Item {
    id: avatarButton
    property bool isOnline: false
    property double side: Math.min(width,height)
    property url avatarImg
    signal avatarclick
    signal stateclick

    Button {
        id: avatar
        width: side
        height: width
        onClicked: avatarclick()
        style: ButtonStyle {
            background: Item {
                Image{
                    id: round
                    source: avatarImg
                    sourceSize: Qt.size(parent.width, parent.height)
                    smooth: true
                    visible: false
                }
                Rectangle{
                    id:mask
                    anchors.fill: parent
                    radius: width/2
                    smooth: true
                    visible: false
                }

                OpacityMask {
                    anchors.fill: round
                    source: round
                    maskSource: mask
                }
                Rectangle{
                    anchors.fill: parent
                    radius: width/2
                    color:Qt.rgba(0, 0, 0, 0)
                    border.width: 0.025*width
                    border.color: "#fff"
                }
            }
        }
    }

    Button {
        id: state
        x: side*0.7071
        width: side*0.2929
        height: width
        onClicked: stateclick()
        style: ButtonStyle {
            background: Image {
                width: parent.width
                height:parent.height
                sourceSize: Qt.size(parent.width,parent.height)
                source:"qrc:/img/svg/online.svg"
            }
        }
    }
}

import QtQuick 2.7
import QtGraphicalEffects 1.0
import "components"

Item{
    id: root
    property alias picture: backImage.source
    property alias radius: mask.radius
    antialiasing: true

    Item{
        id: background
        antialiasing: true
        anchors.fill: parent
        visible: false

        Image{
            id: backImage
            antialiasing: true
            anchors.fill: parent
            source: "qrc:/img/background.png"
            sourceSize: Qt.size(parent.width,parent.height)
            smooth: true
            cache: true
        }

        OtherBack {
            id: otherBack
            height: 50
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.top: parent.top
            antialiasing: true
        }
    }
    
    Rectangle{
        id: mask
        anchors.fill: background
        color: "black"
        radius: 8
        antialiasing: true
        visible: false
    }
    
    OpacityMask{
        antialiasing: true
        anchors.fill: background
        source: background
        maskSource: mask
        cached: true
    }
}

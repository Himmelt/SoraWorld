import QtQuick 2.7
import QtGraphicalEffects 1.0

Item {
    id: root
    antialiasing: true

    property alias source: img.source
    property alias radius: mask.radius
    property alias border: bord.border

    Image{
        id: img
        source: "qrc:/img/image.png"
        antialiasing: true
        anchors.fill: root
        sourceSize: Qt.size(root.width, root.height)
        smooth: true
        cache: true
        visible: false
    }

    Rectangle{
        id: mask
        radius: Math.min(root.width,root.height)/2
        border.width: 0
        antialiasing: true
        anchors.fill: root
        visible: false
    }

    OpacityMask {
        antialiasing: true
        cached: true
        anchors.fill: img
        source: img
        maskSource: mask
    }

    Rectangle{
        id: bord
        anchors.fill: root
        antialiasing: true
        color: "#00000000"
        radius: mask.radius
        border.width: 0
        border.color: "white"
    }
}

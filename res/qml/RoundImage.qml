import QtQuick 2.7
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0


Item {
    id: roundImg
    property url source
    property double radius: width/2
    property double border_width: 0
    property color border_color: "white"

    Image{
        id: img
        anchors.fill: parent
        source: roundImg.source
        sourceSize: Qt.size(parent.width, parent.height)
        smooth: true
        cache: true
        visible: false
    }

    Rectangle{
        id: mask
        anchors.fill: parent
        radius: roundImg.radius
        border.width: 0
        visible: false
    }
    
    OpacityMask {
        anchors.fill: img
        source: img
        maskSource: mask
    }

    Rectangle{
        anchors.fill: parent
        radius: roundImg.radius
        color: "#00000000"
        border.width: roundImg.border_width
        border.color: roundImg.border_color
    }
}

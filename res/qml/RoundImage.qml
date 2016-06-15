import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0


Item {
    id: roundImg
    property url source
    property double radius
    property double border_width: 0.0
    property color border_color: "#fff"


    Image{
        id: img
        anchors.fill: parent
//        fillMode: Image.PreserveAspectCrop
        source: roundImg.source
        sourceSize: Qt.size(parent.width, parent.height)
        smooth: true
        cache: false
        visible: false
    }

    Rectangle{
        id: mask
        anchors.fill: parent
        radius: roundImg.radius
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

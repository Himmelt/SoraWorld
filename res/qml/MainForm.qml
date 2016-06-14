import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtGraphicalEffects 1.0

Item{
    id: item1


    Rectangle{
        id:background
        anchors.fill: parent
        visible: false

        Image{
            anchors.fill: parent
            source: "qrc:/img/bgm3.png"
            smooth: true
            cache: true
        }
        Rectangle{
            height: 50
            color: "#66fec1d5"
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0

        }
    }

    Rectangle{
        id: mask
        anchors.fill: parent
        radius: 10
        color: "black"
        visible: false
    }

    OpacityMask{
        anchors.fill: background
        source: background
        maskSource: mask
        cached: true
    }

}

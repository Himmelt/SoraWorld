import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

Item{
    id: closex
    width: 4*height
    anchors.top: parent.top
    anchors.topMargin: 5
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 5
    anchors.right: parent.right
    anchors.rightMargin: 5

    Button{
        id: close
        width: 30
        height: 30
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 0
        hoverEnabled: true
        background: Image{
            anchors.fill: parent
            source: "qrc:/img/svg/red_" + (min.hovered ? (min.down ? "3" : "2") : "1") + ".svg"
        }
    }

    Button{
        id: max
        width: 30
        height: 30
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: close.left
        anchors.rightMargin: 5
        hoverEnabled: true
        background: Image{
            anchors.fill: parent
            sourceSize: Qt.size(parent.width,parent.height)
            source: "qrc:/img/svg/max_" + (min.hovered ? (min.down ? "3" : "2") : "1") + ".svg"
        }
    }

    Button{
        id: min
        width: 30
        height: 30
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: max.left
        anchors.rightMargin: 5
        hoverEnabled: true
        background: Image{
            anchors.fill: parent
            sourceSize: Qt.size(parent.width,parent.height)
            source: "qrc:/img/svg/min_" + (min.hovered ? (min.down ? "3" : "2") : "1") + ".svg"
        }
    }
}

import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0
import "components"

Item{
    id: root
    property alias currentIndex: menuBar.currentIndex
    Rectangle{
        id: logo
        width: height
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 5
        color: "red"
    }
    
    TabBar {
        id: menuBar
        width: 300
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 5
        
        TabButton {
            text: qsTr("S")
        }
        TabButton {
            text: qsTr("O")
        }
        TabButton {
            text: qsTr("R")
        }
        TabButton {
            text: qsTr("A")
        }
    }
    
    Item{
        id: closex
        width: 4*height
        anchors.top: parent.top
        anchors.topMargin: 8
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        anchors.right: parent.right
        anchors.rightMargin: 8
        
        Xutton {
            id: xxx
            name: "xxx"
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 2
        }
        Xutton {
            id: max
            name: "max"
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: xxx.left
            anchors.rightMargin: 10
        }
        Xutton {
            id: min
            name: "min"
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: max.left
            anchors.rightMargin: 10
        }
    }
}

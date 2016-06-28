import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0
import "pages"
import "components"

Item{
    id: root
    property int radius: 8

    Item{
        id: background
        anchors.fill: root

        property alias bgm: img.source

        Rectangle{
            id: bgm
            anchors.fill: background
            visible: false

            Image{
                id: img
                anchors.fill: bgm
                source: "qrc:/img/background.png"
                smooth: true
                cache: true
            }

            Rectangle{
                height: 50
                color: "#66fec1d5"
                anchors.right: bgm.right
                anchors.rightMargin: 0
                anchors.left: bgm.left
                anchors.leftMargin: 0
                anchors.top: bgm.top
                anchors.topMargin: 0
            }
        }

        Rectangle{
            id: mask
            anchors.fill: background
            color: "black"
            radius: root.radius
            visible: false
        }

        OpacityMask{
            anchors.fill: bgm
            source: bgm
            maskSource: mask
            cached: true
        }
    }

    Item{
        id: topBar
        height: 50
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0

        Item{
            id: logo
            width: height
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
        }

        TabBar {
            id: menuBar
            width: 300
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 5
            font.family: "Microsoft YaHei"
            currentIndex: stackPage.currentIndex

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

    StackLayout {
        id: stackPage
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: topBar.bottom
        anchors.topMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0

        currentIndex: menuBar.currentIndex

        MainPage{
            id: mainPage
        }

        ConfigPage {
            id: config
        }

        ManaPage {
            id: manager
        }
        AboutPage {
            id: about
        }
    }
}

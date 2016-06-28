import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0
import "pages"
import "components"


Item{
    id: root
    property alias radius: mask.radius

    Item{
        id: round
        anchors.fill: root

        property alias bgm: img.source

        Rectangle{
            id: bgm
            anchors.fill: round
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
            anchors.fill: round
            color: "black"
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
            id: tabBar
            width: 300
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 5
            font.family: "微软雅黑"
            currentIndex: stackPage.currentIndex

            TabButton {
                text: qsTr("空")
            }
            TabButton {
                text: qsTr("之")
            }
            TabButton {
                text: qsTr("境")
            }
            TabButton {
                text: qsTr("界")
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

        currentIndex: tabBar.currentIndex

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

import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

Item{
    id: item1

    Item{
        id: background
        anchors.fill: parent

        Rectangle{
            id:bgm
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
            currentIndex: stackPage.currentIndex

            TabButton {
                text: qsTr("First")
            }
            TabButton {
                text: qsTr("Second")
            }
        }

        Item{
            id: close
            width: 4*height
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
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

        MainPage {
            Label{
                text:"1"
            }
        }

        ConfigPage {
            Label{
                text:"2"
            }
        }

        Rectangle {
            id: rect
            width: 100; height: 100
            color: "red"

            MouseArea {
                id: mouseArea
                anchors.fill: parent
            }

            states: State {
                name: "moved"; when: mouseArea.pressed
                PropertyChanges { target: rect; x: 50; y: 50 }
            }

            transitions: [
                Transition {
                    from: "stop"; to: "go"
                    PropertyAnimation { target: stopLight
                        properties: "color"; duration: 1000 }
                },
                Transition {
                    from: "go"; to: "stop"
                    PropertyAnimation { target: goLight
                        properties: "color"; duration: 1000 }
                } ]
        }
        Rectangle {
            width: 100;
            height: 100;
            color: "green"
            RotationAnimation on rotation {
                loops: Animation.Infinite
                from: 0
                to: 360
            }
        }
    }

}

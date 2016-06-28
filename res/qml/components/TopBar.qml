import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4

Rectangle {
    signal closeclick()
    signal maxclick()
    signal minclick()
    color: "#00000000"
    border.color: "#00000000"
    Image{
        id:icon
        width: 50
        height: 50
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 20
        source: "qrc:/img/avatar/liuka.png"
        sourceSize: Qt.size(60,30)
    }

    Rectangle {
        x: 191
        y: 10
        width: 200
        height: parent.height
        color: "#ffffff"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    Rectangle{
        width: 100
        height: 25
        color: "#00000000"
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 15
        border.color: "#00000000"
        Button {
            id: close
            width: parent.height
            height: parent.height
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 0

            style:ButtonStyle{
                background:Rectangle{
                    color: "#00ffffff"
                    Image{
                        sourceSize: Qt.size(parent.width,parent.height)
                        source:"qrc:/img/svg/red_" + ( close.hovered ? (close.pressed ? "3" : "2") : "1") + ".svg";
                    }
                }
            }

            onClicked: closeclick()
        }
        Button {
            id: max
            width: parent.height
            height: parent.height
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter

            style:ButtonStyle{
                background:Rectangle{
                    color: "#00ffffff"
                    Image{
                        sourceSize: Qt.size(parent.width,parent.height)
                        source:"qrc:/img/svg/green_" + ( max.hovered ? (max.pressed ? "3" : "2") : "1") + ".svg";
                    }
                }
            }

            onClicked: maxclick()
        }
        Button {
            id: min
            width: parent.height
            height: parent.height
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 0

            style:ButtonStyle{
                background:Rectangle{
                    color: "#00ffffff"
                    Image{
                        sourceSize: Qt.size(parent.width,parent.height)
                        source:"qrc:/img/svg/brown_" + ( min.hovered ? (min.pressed ? "3" : "2") : "1") + ".svg";
                    }
                }
            }

            onClicked: minclick()
        }
    }

}

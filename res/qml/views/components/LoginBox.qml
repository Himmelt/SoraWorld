import QtQuick 2.7
import QtQuick.Controls 2.0

Rectangle{
    id: rectangle1
    color: "#807d08b7"
    radius: 10

    RoundImage{
        id: current
        width: 80
        height: 80
        anchors.horizontalCenter: parent.horizontalCenter
    }

    TextField{
        id: text_user
        height: 40
        text: "Test"
        horizontalAlignment: Text.AlignHCenter
        anchors.top: current.bottom
        anchors.topMargin: 20
        color: "#028dfd"
        placeholderText: "hold on"
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 20
    }
    TextField{
        id: text_pswd
        color: "green"
        text: ""
        font.family: "Courier"
        horizontalAlignment: Text.AlignHCenter
        placeholderText: "place hold"
        height: 40
        anchors.top: text_user.bottom
        anchors.topMargin: 20
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 20
        background: Rectangle {
            implicitWidth: 200
            implicitHeight: 40
            color: text_pswd.enabled ? "transparent" : "#353637"
            border.color: text_pswd.enabled ? "#21be2b" : "transparent"
        }
    }
    CheckBox {
        id: keepUser
        anchors.top: text_pswd.bottom
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 20
        checked: true
        text: qsTr("记住账号")

    }
    CheckBox {
        id: keepPswd
        anchors.top: text_pswd.bottom
        anchors.topMargin: 20
        anchors.right: parent.right
        anchors.rightMargin: 20
        text: qsTr("记住密码")
        indicator: Rectangle {
            implicitWidth: 26
            implicitHeight: 26
            x: keepPswd.leftPadding
            y: parent.height / 2 - height / 2
            radius: 3
            border.color: keepPswd.down ? "#17a81a" : "#21be2b"

            Rectangle {
                width: 14
                height: 14
                x: 6
                y: 6
                radius: 2
                color: keepPswd.down ? "#17a81a" : "#21be2b"
                visible: keepPswd.checked
            }
        }

        contentItem: Text {
            text: keepPswd.text
            font: keepPswd.font
            opacity: enabled ? 1.0 : 0.3
            color: keepPswd.down ? "#17a81a" : "#21be2b"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            leftPadding: keepPswd.indicator.width + keepPswd.spacing
        }
    }

    Button{
        id: login
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.bottom: parent.bottom
        text: qsTr("登录账号")
    }
}

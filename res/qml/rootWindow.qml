import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0
import QtQuick.LocalStorage 2.0

ApplicationWindow {
    id: rootApp
    width: 800
    height: 500
    color: "#00000000"
    visible: true
    flags: Qt.FramelessWindowHint|Qt.Window
    title: qsTr("Sora World")
    property var db: LocalStorage.openDatabaseSync("SoraClient", "1.0", "SoraClient", 10000)
    Component.onCompleted: {
        db.transaction(function (tx) {
            tx.executeSql("CREATE TABLE IF NOT EXISTS `userlist` (`username` TEXT,`password` TEXT)");
            var rs = tx.executeSql("select * from userlist"),i = rs.rows.length;
            while (i--) {
                var item = rs.rows.item(i);
                listmodel.append({username: item.username,password: item.password});
            }
        });
    }

    MouseArea{
        anchors.fill: parent
        anchors.margins: 8
        property variant pos
        onPressed: pos = Qt.point(mouseX, mouseY)
        onPositionChanged: {
            if (pressedButtons === Qt.LeftButton) {
                rootApp.setX(rootApp.x + mouseX - pos.x)
                rootApp.setY(rootApp.y + mouseY - pos.y)
            }
        }
    }

    Item{
        id: rootForm
        anchors.fill: parent
        anchors.margins: 8
        Item {
            anchors.fill: parent

            Item{
                id: background
                antialiasing: true
                anchors.fill: parent
                visible: false

                Image{
                    id: backImage
                    antialiasing: true
                    anchors.fill: parent
                    source: "qrc:/img/background.png"
                    sourceSize: Qt.size(parent.width,parent.height)
                    smooth: true
                    cache: true
                }

                Item {
                    id: otherBack
                    height: 50
                    anchors.right: parent.right
                    anchors.left: parent.left
                    anchors.top: parent.top
                    Rectangle{
                        height: 50
                        anchors.fill: parent
                        color: "#66fec1d5"
                    }
                }
            }

            Rectangle{
                id: mask
                anchors.fill: background
                color: "black"
                radius: 8
                antialiasing: true
                visible: false
            }

            OpacityMask{
                antialiasing: true
                anchors.fill: background
                source: background
                maskSource: mask
                cached: true
            }
        }

        Item {
            id: topBar
            height: 50
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.top: parent.top

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
                font.family: "微软雅黑"
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

                Button {
                    id: xxx
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 2
                    width: 24
                    height: 24
                    hoverEnabled: true

                    background: Image{
                        anchors.fill: xxx
                        source: "qrc:/img/svg/xxx" + "_" + (xxx.hovered ? (xxx.down ? "3" : "2") : "1") + ".svg"
                    }
                }
                Button {
                    id: max
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: xxx.left
                    anchors.rightMargin: 10
                    width: 24
                    height: 24
                    hoverEnabled: true

                    background: Image{
                        anchors.fill: max
                        source: "qrc:/img/svg/max" + "_" + (max.hovered ? (max.down ? "3" : "2") : "1") + ".svg"
                    }
                }
                Button {
                    id: min
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: max.left
                    anchors.rightMargin: 10
                    width: 24
                    height: 24
                    hoverEnabled: true

                    background: Image{
                        anchors.fill: min
                        source: "qrc:/img/svg/min" + "_" + (min.hovered ? (min.down ? "3" : "2") : "1") + ".svg"
                    }
                }
            }
        }

        StackLayout {
            id: stackPage
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.top: topBar.bottom
            anchors.bottom: parent.bottom

            currentIndex: menuBar.currentIndex

            Item{
                id: mainPage
                ListView{
                    id: userlist
                    interactive: false
                    clip: true
                    antialiasing: true
                    orientation: ListView.Horizontal
                    snapMode: ListView.SnapOneItem
                    highlightRangeMode: ListView.ApplyRange
                    anchors.top: parent.top
                    anchors.topMargin: 20

                    spacing: 20
                    width: 5*50 + 4*spacing
                    height:50
                    anchors.left: parent.left
                    anchors.leftMargin: 10

                    footer: Button{
                        width: userlist.count === 0 ? 50 : userlist.spacing + 50
                        height: 50
                        RoundImage{
                            anchors.right: parent.right
                            width:50
                            height:50
                        }
                        onClicked: {
                            listmodel.append({username:"avatar",password:"hhhh"})
                        }
                    }

                    model: ListModel{
                        id: listmodel
                    }

                    delegate: AvatarDelegate{
                        width: 50
                        height: 50
                        source: "file:///" + rootPath + "/avatar/" + username + ".png"
                        onStateClicked: listmodel.remove(index)

                        onClicked: {
                            listmodel.insert(index,{username:"Himmelt",password:"pssd"})
                        }
                    }
                }


                Item{
                    id: news
                    anchors.left: userlist.left
                    anchors.right: loginBox.left
                    anchors.rightMargin: 10
                    anchors.top: userlist.bottom
                    anchors.topMargin: 10
                    anchors.bottomMargin: 10
                    anchors.leftMargin: 0

                    Button{
                        text:　"Save"
                        onClicked:{
                            db.transaction(function (tx) {
                                tx.executeSql("delete from `userlist`");
                                var i = listmodel.count;
                                while (i--) {
                                    var item = listmodel.get(i);
                                    tx.executeSql("insert into `userlist` values (?,?)", [item.username, item.password]);
                                }
                            })
                        }
                    }
                }

                Rectangle{
                    id: loginBox
                    width: 330
                    anchors.bottom: parent.bottom
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.topMargin: 20
                    anchors.rightMargin: 10
                    anchors.bottomMargin: 10
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

            }

            Item {
                id: config
            }

            Item {
                id: manager
            }
            Item {
                id: about
            }
        }
    }

    DropShadow{
        anchors.fill: rootForm
        source : rootForm
        color : "#80000000"
        horizontalOffset : 2
        verticalOffset : 2
        radius : 8
        samples : 16
    }
}

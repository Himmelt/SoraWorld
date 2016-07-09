import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0
import QtQuick.LocalStorage 2.0
import "widget"

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
            tx.executeSql("CREATE TABLE IF NOT EXISTS `userlist` (`username` TEXT,`password` TEXT,`gamemode` INTEGER DEFAULT 1,`keeppswd` INTEGER DEFAULT 1)");
            var rs = tx.executeSql("select * from userlist"),length = rs.rows.length;
            for(var i=0;i<length && i < 4;i++){
                var item = rs.rows.item(i);
                listmodel.append({username: item.username,password: item.password,gamemode: item.gamemode,keeppswd:item.keeppswd});
            }
        });

        if(listmodel.count > 0){
            var first = listmodel.get(0);
            text_user.text = first.username;
            text_pswd.text = first.password;
            current.source = "file:///" + rootPath + "/avatar/" + first.username + ".png"
        }
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
                        enabled: (userlist.count < 4) ? true : false
                        RoundImage{
                            anchors.right: parent.right
                            width:50
                            height:50
                        }
                        onClicked: {
                            listmodel.append({username:"avatar",password:"hhhh",gamemode:1,keeppswd:0});
                            userlist.currentIndex = listmodel.count - 1;
                            text_user.text = "";
                            text_pswd.text = "";
                            current.source = "qrc:/img/avatar/default.png";
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
                        border.color: ListView.isCurrentItem ? "red":"white"
                        onClicked: {
                            userlist.currentIndex = index;
                            text_user.text = username;
                            text_pswd.text = password;
                            current.source = source;
                        }
                    }
                    Component.onCompleted: console.log("list",userlist.currentIndex)
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
                                    tx.executeSql("insert into `userlist` values (?,?,?,?)", [item.username, item.password,item.gamemode,item.keeppswd]);
                                }
                            })
                            console.log(userlist.currentIndex)
                            console.log(listmodel.get(userlist.currentIndex).username)
                            console.log(userlist.currentItem.source)
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
                    color: "#107d08b7"
                    radius: 10

                    RoundImage{
                        id: current
                        width: 80
                        height: 80
                        border.width: 2
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    ITextField {
                        id: text_user
                        anchors.top: current.bottom
                        anchors.topMargin: 20
                        anchors.left: parent.left
                        anchors.leftMargin: 20
                        anchors.right: parent.right
                        anchors.rightMargin: 20
                        placeholderText: qsTr("请输入ID...")
                    }
                    ITextField {
                        id: text_pswd
                        anchors.top: text_user.bottom
                        anchors.topMargin: 20
                        anchors.left: parent.left
                        anchors.leftMargin: 20
                        anchors.right: parent.right
                        anchors.rightMargin: 20
                        placeholderText: qsTr("请输入密码...")
                        enabled: keepOnline.checked
                    }
                    ICheckBox {
                        id: keepOnline
                        anchors.top: text_pswd.bottom
                        anchors.topMargin: 20
                        anchors.left: parent.left
                        anchors.leftMargin: 20
                        text: qsTr("登录空境")
                        checked: true
                    }
                    ICheckBox{
                        id: keepPswd
                        anchors.top: text_pswd.bottom
                        anchors.topMargin: 20
                        anchors.right: parent.right
                        anchors.rightMargin: 20
                        text: qsTr("记住密码")
                        enabled: keepOnline.checked
                    }

                    Button{
                        id: login
                        anchors.left: parent.left
                        anchors.leftMargin: 20
                        anchors.right: parent.right
                        anchors.rightMargin: 20
                        anchors.bottom: parent.bottom
                        text: qsTr("登录账号")
                        onClicked: {
                            var i = userlist.currentIndex
                            if(i >= 0){
                                listmodel.get(i).username = text_user.text
                            }
                        }
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

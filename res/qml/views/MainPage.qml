import QtQuick 2.7
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0
import "components"
import "qrc:/js/config.js" as Config

Item{
    id: root

    Userlist{
        id: userlist
        anchors.top: parent.top
        anchors.topMargin: 20

        spacing: 20
        width: 5*50 + 4*spacing
        height:50
        anchors.left: parent.left
        anchors.leftMargin: 10
    }

    News{
        id: news
        anchors.left: userlist.left
        anchors.right: loginBox.left
        anchors.rightMargin: 10
        anchors.top: userlist.bottom
        anchors.topMargin: 10
        anchors.bottomMargin: 10
        anchors.leftMargin: 0

        Button{
            onClicked: Config.saveModel()
            Component.onCompleted: text = Config.rootPath
        }
    }

    LoginBox {
        id: loginBox
        width: 330
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.rightMargin: 10
        anchors.bottomMargin: 10

    }
}

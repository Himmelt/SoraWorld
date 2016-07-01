import QtQuick 2.7
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0
import "components"

Item{
    id: root

    Userlist{
        id: userlist
        anchors.top: parent.top
        anchors.topMargin: 10

        spacing: 20
        width: 5*50 + 4*spacing
        height:50
        anchors.left: parent.left
        anchors.leftMargin: 20



    }

    News{
        id: news
        anchors.left: userlist.left
        anchors.right: loginBox.left
        anchors.rightMargin: 10
        anchors.top: userlist.bottom
        anchors.topMargin: 10
        anchors.bottomMargin: 20
        anchors.leftMargin: 0

    }

    LoginBox {
        id: loginBox
        width: 330
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.rightMargin: 20
        anchors.bottomMargin: 20
    }
}



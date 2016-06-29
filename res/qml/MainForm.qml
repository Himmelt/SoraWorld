import QtQuick 2.7
import QtQuick.Layouts 1.3
import "views"

Item{
    id: root
    Background {
        id: background
        anchors.fill: parent
    }

    MenuBar {
        id: menuBar
        height: 50
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        currentIndex: stackPage.currentIndex
    }

    StackLayout {
        id: stackPage
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: menuBar.bottom
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

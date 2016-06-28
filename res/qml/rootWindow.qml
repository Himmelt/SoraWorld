import QtQuick 2.7
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0
import QtQuick.LocalStorage 2.0
import "qrc:/js/config.js" as Config

ApplicationWindow {
    id: root
    width: 800
    height: 500
    color: "#00000000"
    flags: Qt.FramelessWindowHint|Qt.Window
    title: qsTr("Sora World")

    property int radius: 8

    MouseArea{
        anchors.fill: parent
        anchors.margins: root.radius

        property variant pos

        onPressed: {
            pos = Qt.point(mouseX, mouseY);
        }
        onPositionChanged: {
            if (root.visibility !== 4 && pressedButtons === Qt.LeftButton) {
                root.setX(root.x + mouseX - pos.x);
                root.setY(root.y + mouseY - pos.y);
            }
        }
    }

    MainForm{
        id: rootForm
        anchors.fill: parent
        anchors.margins: root.radius
    }

    DropShadow{
        anchors.fill: rootForm
        source : rootForm
        cached : true
        color : "#80000000"
        horizontalOffset : 2
        verticalOffset : 2
        radius : root.radius
        samples : 16
    }

    Component.onCompleted: {
        var db =LocalStorage.openDatabaseSync("SoraClient","1.0","SoraConfig", 10000);
        Config.loadDB(db)
        console.log("root completed!")
    }
}

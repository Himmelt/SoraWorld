import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import QtQuick.LocalStorage 2.0
import "qrc:/js/config.js" as Config


ApplicationWindow {
    id: root
    visible: true
    width: 800
    height: 500
    color: "#00000000"
    flags: Qt.FramelessWindowHint|Qt.Window
    title: qsTr("Sora World")

    property int shadow_radius: 8

    MouseArea{
        anchors.fill: parent
        anchors.margins: shadow_radius

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
        anchors.margins: shadow_radius
        Component.onCompleted: {
            console.log("MainForm completed!")
            Config.loadUsers()
        }
    }

    DropShadow{
        anchors.fill: rootForm
        source : rootForm
        cached : true
        color : "#80000000"
        horizontalOffset : 2
        verticalOffset : 2
        radius : 8.0
        samples : 16
    }

    Component.onCompleted: {
        var db =LocalStorage.openDatabaseSync("SoraClient","1.0","SoraConfig", 10000);
        Config.loadDB(db)
        console.log("root completed!")
    }
}

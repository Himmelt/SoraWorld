import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0

ApplicationWindow {
    id: rootWindow
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
            if (rootWindow.visibility !== 4 && pressedButtons === Qt.LeftButton) {
                rootWindow.setX(rootWindow.x + mouseX - pos.x);
                rootWindow.setY(rootWindow.y + mouseY - pos.y);
            }
        }
    }

    MainForm{
        id: rootForm
        anchors.fill: parent
        anchors.margins: shadow_radius
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
}

import QtQuick 2.7
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0

ApplicationWindow {
    id: root
    width: 800
    height: 500
    color: "#00000000"
    visible: true
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
}

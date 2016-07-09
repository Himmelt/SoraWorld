import QtQuick 2.7
import QtQuick.Controls 2.0

TextField{
    id: root
    height: 40
    color: "green"
    font.family: "Courier"
    horizontalAlignment: Text.AlignHCenter
    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 40
        color: root.enabled ? "transparent" : "#353637"
        border.color: root.enabled ? "#21be2b" : "transparent"
    }
}

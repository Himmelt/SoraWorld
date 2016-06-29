import QtQuick 2.7
import QtQuick.Controls 2.0

Button{
    id: control
    width: 24
    height: 24
    hoverEnabled: true
    property string name

    background: Image{
        anchors.fill: control
        source: "qrc:/img/svg/" + name + "_" + (control.hovered ? (control.down ? "3" : "2") : "1") + ".svg"
    }
}

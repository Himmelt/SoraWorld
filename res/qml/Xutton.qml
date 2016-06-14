import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0


Button{
    property string name
    id: control
    width: 30
    height: 30
    hoverEnabled: true
    background: Image{
        anchors.fill: parent
        source: "qrc:/img/svg/" + name + "_" + (control.hovered ? (control.down ? "3" : "2") : "1") + ".svg"
    }
}

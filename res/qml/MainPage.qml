import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

Item{
    RoundImage{
        x: 192
        y: 123
        width: 255
        height: 100
        radius: 10
        source: "qrc:/img/avatar/avatar.png"
        border_width: 1
        border_color: "pink"
    }
}

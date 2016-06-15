import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

Item{
    id: closex
    width: 4*height
    anchors.top: parent.top
    anchors.topMargin: 5
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 5
    anchors.right: parent.right
    anchors.rightMargin: 5

    Img {
        anchors.fill: parent
    }
}

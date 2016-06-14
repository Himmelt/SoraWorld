import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4

MainForm {
    button1.onClicked: {
        console.log("Button 1 clicked.");
    }
    button2.onClicked: {
        console.log("Button 2 clicked.");
    }
    Image{
        source:"qrc:/img/bgm3.png"
        sourceSize: Qt.size(100,300)
    }
}

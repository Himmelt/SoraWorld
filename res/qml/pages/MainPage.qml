import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0 as Control
import QtQuick.LocalStorage 2.0
import "../components"
import "qrc:/js/config.js" as Config

Item{
    id: mainPage

    Userlist {
        id: userlist
    }

    News{

    }

    LoginBox {
        width: height*0.75
    }
}

import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0 as Control
import QtQuick.LocalStorage 2.0
import "qrc:/js/config.js" as Config

ListView{
    id: userlist
    width: 200
    height: 50
    highlightRangeMode: ListView.ApplyRange
    
    model: ListModel{
        id: listmodel
        ListElement{
            username: "default"
        }
    }
    
    delegate: AvatarDelegate {
        width:150
        height:150
    }
    
}

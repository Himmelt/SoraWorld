import QtQuick 2.7
import QtQuick.Controls 2.0
import "qrc:/js/config.js" as Config

ListView{
    id: userlist
    width: 300
    height: 50
    interactive: false
    clip: true
    antialiasing: true
    orientation: ListView.Horizontal
    snapMode: ListView.SnapOneItem
    highlightRangeMode: ListView.ApplyRange


    footer: Button{
        width: userlist.count === 0 ? 50 : userlist.spacing + 50
        height: 50
        RoundImage{
            anchors.right: parent.right
            width:50
            height:50
        }
        onClicked: {
            listmodel.append({username:"avatar",password:"hhhh"})
        }
    }

    model: ListModel{
        id: listmodel
    }

    delegate: AvatarDelegate{
        width: 50
        height: 50

        onStateClicked: listmodel.remove(index)

        onClicked: {
            listmodel.insert(index,{username:"Himmelt",password:"pssd"})
        }
        Component.onCompleted: {
            source = "file:///" + Config.rootPath + "/avatar/" + username + ".png"
        }
    }

    Component.onCompleted: Config.loadModel(listmodel)
}

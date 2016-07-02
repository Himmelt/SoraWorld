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
        onClicked: Config.test()
    }

    model: ListModel{
        id: listmodel
        Component.onCompleted: Config.loadModel(listmodel)
    }

    delegate: AvatarDelegate{
        width: 50
        height: 50
        source: "qrc:/img/avatar/" + username + ".png"
        onStateClicked: listmodel.remove(index)

        Component.onCompleted: console.log("index:",index)

        onClicked: console.log("listmodel.insert(index,{username:Himmelt})")
    }
}

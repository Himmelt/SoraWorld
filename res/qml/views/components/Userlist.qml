import QtQuick 2.7

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
    footer: Item{
        width: userlist.count === 0 ? 50 : userlist.spacing + 50
        height: 50
        RoundImage{
            anchors.right: parent.right
            width:50
            height:50
        }
    }

    model: ListModel{
        id: listmodel
    }

    delegate: AvatarDelegate{
        width: 50
        height: 50
        source: "qrc:/img/avatar/" + username + ".png"
        onStateClicked: listmodel.remove(index)

        Component.onCompleted: console.log("index:",index)

        onClicked: listmodel.insert(index,{username:"Himmelt"})
    }
}

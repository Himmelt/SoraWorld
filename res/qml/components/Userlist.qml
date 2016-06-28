import QtQuick 2.7

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

import QtQuick 2.7
import QtQuick.Controls 2.0

Item{
    id: mainPage

    TabBar {
        id: tabBar
        x: 20
        y: 20
        height: 50
        spacing: 10
        background: Item{}

        function updateIndex(){
            for(var i = 0;i < tabBar.contentChildren.length;i++){
                console.log("childern:" , i)
                tabBar.contentChildren[i].index = i
                console.log(tabBar.contentChildren[i])
            }
        }


        TabAvatar{
            id: aaa
            onStateclick: {
                console.log("INDEX:",index)
                tabBar.removeItem(index)
                tabBar.updateIndex()
            }
        }
        TabAvatar{
            onStateclick: {
                console.log("INDEX:",index)
                tabBar.removeItem(index)
                tabBar.updateIndex()
            }
        }
        TabAvatar{
            onStateclick: {
                console.log("INDEX:",index)
                tabBar.removeItem(index)
                tabBar.updateIndex()
            }
        }
        TabAvatar{
            onStateclick: {
                console.log("INDEX:",index)
                tabBar.removeItem(index)
                tabBar.updateIndex()
            }
            avatarImg: "/img/round.png"
        }
    }
    Button {
        anchors.centerIn: mainPage

        onClicked: {
            console.log("currentIndex:" , tabBar.currentIndex)

            var queen = Qt.createComponent("TabAvatar.qml")

            var item = queen.createObject()

            console.log("Queen:" , queen,"|Item:",item)

//            tabBar.removeItem(0)

            console.log(tabBar.count)

            tabBar.updateIndex()

        }
    }

    LoginBox {
        width: height*0.75
    }
}

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

        function removeIndex(index){
            tabBar.removeItem(index)
            tabBar.updateIndex()
        }

        TabAvatar{
        }
        TabAvatar{
        }

        Component.onCompleted: updateIndex()
    }

    LoginBox {
        width: height*0.75
    }
}

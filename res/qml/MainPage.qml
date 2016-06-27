import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.LocalStorage 2.0
import "qrc:/js/config.js" as Config

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
                tabBar.contentChildren[i].index = i
            }
        }

        function removeIndex(index){
            tabBar.removeItem(index)
//            tabBar.updateIndex()
        }

        function loadIndex(){

        }

        Repeater{
            model:Config.Mymodel
                /*ListModel{
                id: listmodel
                ListElement{
                    img:"avatar.png"
                }
                ListElement{
                    img:"Himmelt.png"
                }
                ListElement{
                    img:"Ikaros.png"
                }
                ListElement{
                    img:"liuka.png"
                }
                ListElement{
                    img:"modelHimmelt.png"
                }
            }*/

            TabAvatar{
                avatarImg: "qrc:/img/avatar/" + modelData
                onStateclick:{
                    console.log(index)
                    listmodel.remove(index)
               }
                onClicked: {
                    console.log(index," ",tabBar.currentIndex)
                }
            }
        }

//        Component.onCompleted: updateIndex()
    }


    News{

    }

    LoginBox {
        width: height*0.75
    }
}

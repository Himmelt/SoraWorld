import QtQuick 2.7
import "../components"

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

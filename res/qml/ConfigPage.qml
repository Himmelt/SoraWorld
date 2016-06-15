import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

Item{
    AvatarButton{
        id:avatar1
        x: 258
        y: 124
        width: 60
        height: 60
        avatarImg: "qrc:/img/avatar/avatar.png"

        onAvatarclick: {
            avatar1.isOnline = !avatar1.isOnline
            console.log("qqqqwwww")
        }
    }

}

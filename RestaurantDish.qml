import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.15
Rectangle {
    id: rec

    property alias dishName: dishName.text
    property alias dishPhoto: dishImage.source
    property alias dishWeight: dishWeight.text
    property alias dishPrice: dishPrice.text

    height: Window.width * 0.7
    anchors.left: parent.left
    anchors.right: parent.right
    radius: 10
    color: "transparent"

    Image {
        id: dishImage
        anchors.right: rec.right
        anchors.left: rec.left
        height: rec.height * 0.8
        visible: false
        source: "Images/restaurantButton.jpg"

    }

    OpacityMask {
        id: mask
        anchors.fill: dishImage
        source: dishImage
        maskSource: Rectangle {
            width: dishImage.width
            height: dishImage.height
            radius: 20
            visible: false
        }
    }



    Text {
        id: dishPrice
        anchors.top:  dishImage.bottom
        font.pixelSize: Window.width * 0.06
    }


    Text {
        id: dishName
        anchors.top: dishPrice.bottom
        font.pixelSize: Window.width * 0.06
    }

    Text {
        id: dishWeight
        anchors.top: dishName.bottom
        font.pixelSize: Window.width * 0.06
    }
}

    // width: 100
    // height: 100
    // color: "transparent"

    // Image {
    //     id: dishImage
    //     fillMode: Image.PreserveAspectFit
    //     height: parent.height / 2
    //     anchors.left: parent.left
    //     anchors.top: parent.top
    // }

    // Text {
    //     id: dishPrice
    //     anchors.top: dishImage.bottom
    //     anchors.left: dishImage.left
    //     text: "asfasf"
    //     color: "black"
    // }

    // Text {
    //     id: dishName
    //     anchors.top: dishPrice.bottom
    //     anchors.left: dishPrice.left
    //     text: "asfasf"
    //     color: "black"
    // }

    // Text {
    //     id: dishWeight
    //     anchors.top: dishName.bottom
    //     anchors.left: dishName.left
    //     text: "asfasf"
    //     color: "black"
    // }
// }

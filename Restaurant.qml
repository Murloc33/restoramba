import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.15



Rectangle {
    id: rec

    property alias restaurantName: restaurantName.text
    property alias restaurantRating: restaurantRating.text
    property alias restaurantDistance: restaurantDistance.text
    property alias restaurantPhoto: restaurantPhoto.source
    property alias restaurantStar: restaurantStar.source
    property alias restaurantRatingStr: restaurantRatingStr.text

    height: Window.width * 0.7
    anchors.left: parent.left
    anchors.right: parent.right
    radius: 10
    color: "transparent"

    Image {
        id: restaurantPhoto
        anchors.right: rec.right
        anchors.left: rec.left
        height: rec.height * 0.8
        visible: false

        Rectangle {
            id: imrec
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            width: restaurantPhoto.width * 0.4
            height: restaurantPhoto.height * 0.2
            color: "black"
            opacity: 0.7
            radius: 20
        }

        Image {
            id: locimg
            anchors.left: imrec.left
            anchors.bottom: imrec.bottom
            anchors.leftMargin: imrec.width * 0.1
            anchors.bottomMargin: imrec.height * 0.3
            width: imrec.width * 0.1
            height: imrec.height * 0.4
            source: "Images/subtract.png"
        }

        Text {
            id: restaurantDistance
            anchors.left: locimg.right
            anchors.bottom: imrec.bottom
            anchors.leftMargin: imrec.width * 0.07
            anchors.bottomMargin: imrec.height * 0.28
            font.pixelSize: Window.width * 0.04
            color: "white"
        }
    }

    OpacityMask {
        anchors.fill: restaurantPhoto
        source: restaurantPhoto
        maskSource: Rectangle {
            width: restaurantPhoto.width
            height: restaurantPhoto.height
            radius: 20
            visible: false
        }
    }


    Text {
        id: restaurantName
        anchors.top: restaurantPhoto.bottom
        font.pixelSize: Window.width * 0.06
    }

    Image {
        id: restaurantStar
        anchors.top: restaurantName.bottom
        anchors.topMargin: 2
        anchors.left: restaurantPhoto.left
        width: Window.width * 0.05
        height: Window.width * 0.05
    }


    Text {
        id: restaurantRating
        anchors.left: restaurantStar.right
        anchors.top: restaurantName.bottom
        anchors.leftMargin: 5
        font.pixelSize: Window.width * 0.05
    }

    Text {
        id: restaurantRatingStr
        anchors.left: restaurantRating.right
        anchors.bottom: restaurantRating.bottom
        anchors.leftMargin: 5
        font.pixelSize: Window.width * 0.05
    }
}



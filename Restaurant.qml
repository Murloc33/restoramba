import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12

Item {
    property alias restaurantName: restaurantName.text
    property alias restaurantRating: restaurantRating.text
    property alias restaurantDistance: restaurantDistance.text
    property alias restaurantPhoto: restaurantPhoto.source

    Rectangle {
        id: rec
        anchors.fill: parent
        radius: 10
        color: "transparent"

        Image {
            id: restaurantPhoto
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit

            Text {
                id: restaurantDistance
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.margins: 10
                font.pixelSize: Window.width * 0.03
            }
        }
    }

    ColumnLayout {
        id: col
        anchors.top: rec.bottom
        spacing: 10

        Text {
            id: restaurantName
            font.pixelSize: Window.width * 0.05
        }

        Text {
            id: restaurantRating
        }
    }
}




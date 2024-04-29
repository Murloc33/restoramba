import QtQuick 2.12
import QtQuick.Controls 2.12

Button {
    id: root

    width: image.width
    height: image.height




    Image {
        id: image
        source: "qrc:/Images/restaurantButton.jpg"
    }

    onClicked: {
        console.info("image clicked")
    }



}

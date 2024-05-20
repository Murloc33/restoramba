import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import NearestRestaurantModel 1.0
ColumnLayout {
    id: root
    Layout.leftMargin: Window.width * 0.03
    Layout.rightMargin: Window.width * 0.03



    ListView {
        anchors.fill: parent
        model: NearestRestaurantModel {
            id: model
        }


        spacing: 200


        delegate: Restaurant {
            width: root.width
            height: root.width * 0.3
            restaurantName: model.name
            restaurantRating: model.rating
            restaurantDistance: model.distance
            restaurantPhoto: model.photo
        }
    }

}


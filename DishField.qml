import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import DishesNearestRestaurantModel 1.0

ColumnLayout {

    ListView {
        anchors.fill: parent
        model: DishesNearestRestaurantModel {
            id: model
        }

        spacing: Window.width * 0.1


        delegate: RestaurantDish {
            dishName: model.name
            dishPhoto: model.photo
            dishPrice: model.price
            dishWeight: model.weight
        }

        clip: true
        ScrollBar.vertical: ScrollBar { }
    }
}



import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4

ColumnLayout {
    id: columnRow

    Row {
        spacing: root.width * 0.138
        Layout.topMargin: Window.width * 0.2
        Layout.leftMargin: Window.width * 0.107
        Layout.rightMargin: Window.width * 0.107

                Button {
                    id: restaurantButton

                    width: Window.width * 0.3
                    height: Window.width * 0.3

                    onClicked: stackView.push(pageComponentRestaurantMenu)
                    

                    Column {
                        Image {
                            id: restaurantImage
                            width: restaurantButton.width
                            height: restaurantButton.height
                            source: "qrc:/Images/restaurantButton.jpg"
                        }

                        Text {
                            text: "Ресторан"
                            width: restaurantButton.width
                            horizontalAlignment: Text.AlignHCenter
                            font.pixelSize: restaurantButton.width * 0.2
                        }
                    }

                }

                Button {
                    id: deliveryButton
                    width: Window.width * 0.3
                    height: Window.width * 0.3

                        Column {
                            Image {
                                id: deliveryImage
                                width: deliveryButton.width
                                height:deliveryButton.height
                                source: "qrc:/Images/deliveryButton.jpg"
                            }

                            Text {
                                text: "Доставка"
                                width: deliveryButton.width
                                horizontalAlignment: Text.AlignHCenter
                                font.pixelSize: deliveryButton.width * 0.2
                            }
                        }
                    }
                }
}

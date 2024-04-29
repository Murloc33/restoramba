import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4

ColumnLayout {
    id: columnRow

    anchors.fill: parent

    Row {

        spacing: root.width * 0.138

        Layout.topMargin: 125
        Layout.bottomMargin: root.height * 0.70
        Layout.leftMargin: root.width * 0.107
        Layout.rightMargin: root.width * 0.107
                Button {
                    id: restaurantButton

                    width: 128
                    height: 128

                    anchors.left: parent.right
                    Column {
                        Image {
                            id: restaurantImage

                            width: restaurantButton.width
                            height: restaurantButton.height

                            source: "qrc:/Images/restaurantButton.jpg"
                        }

                        Text {
                            text: "Ретсоран"
                            width: restaurantButton.width

                            horizontalAlignment: Text.AlignHCenter

                            font.pixelSize: 18
                        }
                    }
                }

                Button {
                    id: deliveryButton

                    width: 128
                    height: 128

                    anchors.right: parent.left
                    // width: deliveryImage.width
                    // height: deliveryImage.height

                        Column {
                            Image {
                                id: deliveryImage

                                width: deliveryButton.width
                                height: deliveryButton.height

                                source: "qrc:/Images/deliveryButton.jpg"
                            }

                            Text {
                                text: "Доставка"
                                width: deliveryButton.width

                                horizontalAlignment: Text.AlignHCenter

                                font.pixelSize: 18
                        }
                }
            }
        }

}

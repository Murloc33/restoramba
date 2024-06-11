import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4
Page {
    id: restaurantMenu
    anchors.fill: parent

    ColumnLayout {
        anchors.fill: parent
        // spacing: Window.height * 0.075

        Image {
            id: restaurantImage
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.maximumHeight: parent.height / 2
            source: "https://eda.yandex.ru//images/1472406/f3ca23def056466fba9a5a26a1074fee-{w}x{h}.jpg"

            RowLayout {
                id: ratingAndDistance
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                width: parent.width * 0.8
                height: parent.height * 0.1
                anchors.leftMargin: restaurantImage.width * 0.05
                anchors.bottomMargin: restaurantImage.height * 0.05
                spacing: 0

                Rectangle {
                    id: distanceRectangle
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.maximumWidth: parent.width * 0.45

                    color: "white"
                    opacity: 0.7
                    radius: 20

                    // RowLayout {
                    //     anchors.left: distanceRectangle.left
                    //     anchors.bottom: distanceRectangle.bottom
                    //     anchors.fill: parent
                    //     anchors.leftMargin: distanceRectangle.width * 0.1
                    //     anchors.rightMargin: distanceRectangle.width * 0.15
                    //     spacing: distanceRectangle.width * 0.1

                    Image {
                        id: locationImage
                        anchors.left: distanceRectangle.left
                        anchors.bottom: distanceRectangle.bottom
                        anchors.leftMargin: distanceRectangle.width * 0.1
                        anchors.bottomMargin: distanceRectangle.height * 0.15
                        height: distanceRectangle.height * 2/3
                        width: distanceRectangle.width * 0.2
                        fillMode: Image.PreserveAspectFit
                        source: "Images/subtract.png"
                    }

                    Text {
                        id: restaurantDistance
                        anchors.left: locationImage.left
                        anchors.bottom: locationImage.bottom
                        anchors.leftMargin: distanceRectangle.width * 0.23
                        anchors.bottomMargin: distanceRectangle.height * 0.12
                        text: "100 метров"
                        font.pixelSize: distanceRectangle.height * 0.35
                        color: "black"
                    }
                    // }
                }

                Rectangle {
                    id: ratingRectangle
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.maximumWidth: parent.width * 0.45
                    color: "white"
                    opacity: 0.7
                    radius: 20

                    Image {
                        id: ratingImage
                        anchors.left: ratingRectangle.left
                        anchors.bottom: ratingRectangle.bottom
                        anchors.leftMargin: ratingRectangle.width * 0.1
                        anchors.bottomMargin: ratingRectangle.height * 0.15
                        height: ratingRectangle.height * 2/3
                        width: ratingRectangle.width * 0.2
                        fillMode: Image.PreserveAspectFit
                        source: "Images/goodStar.png"
                    }

                    Text {
                        id: restaurantRating
                        anchors.left: ratingImage.left
                        anchors.bottom: ratingImage.bottom
                        anchors.leftMargin: ratingRectangle.width * 0.23
                        anchors.bottomMargin: ratingRectangle.height * 0.12
                        text: "4.7 Отлично"
                        font.pixelSize: ratingRectangle.height * 0.35
                        color: "black"
                    }
                }
            }

            Text {
                anchors.bottom: ratingAndDistance.top
                anchors.left: ratingAndDistance.left
                anchors.bottomMargin: restaurantImage.height * 0.033
                font.pixelSize: restaurantImage.width * 0.1
                color: "white"
                text: "<b>Ami-Ami<b>"
            }
        }




        // Text {
        //     id: allDishes
        //     anchors.top: restaurantImage.bottom
        //     font.pixelSize: Window.width * 0.05
        //     text: "<b>Все блюда<b>"

        // }

        DishField {
            id: scroller
            // anchors.top: allDishes.bottom
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.maximumHeight: parent.height / 2
        }
    }

    RoundButton {
        id: backButton


        anchors.left: parent.left
        anchors.top: parent.top

        anchors.leftMargin: 10
        anchors.topMargin: 10

        width: parent.width * 0.1
        height: parent.width * 0.1


        onClicked: stackView.pop()


        Image {
            anchors.fill: parent
            source: "Images/Arrow_left.png"
        }
    }

}




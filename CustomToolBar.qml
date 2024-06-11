import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.2
import QtQuick.Controls.Styles 1.4

ToolBar {
        id: root

        RowLayout {
            id: rowLayout

            anchors.fill: parent

            Rectangle {
                color: "white"
                anchors.fill: rowLayout
            }

            RoundButton{
                id: userButton

                width: 44
                height: 44

                palette.button: "white"

                radius: 80

                Image {
                    source: "qrc:/Images/userButton.png"
                    anchors.fill: userButton
                }
            }

            RoundButton{
                id: locationButton
                anchors.centerIn: rowLayout
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.leftMargin: 30
                Layout.rightMargin: 30
                palette.button: "Orange"
                radius: 15

                Text {
                    id: textAdress
                    text: "Адрес >"
                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 15
                }

                Text {
                    text: "8 Марта, 46"
                    anchors.top: textAdress.top
                    anchors.topMargin: 15
                    anchors.horizontalCenter: textAdress.horizontalCenter
                    font.pixelSize: 20
                }
             }
        }
    }

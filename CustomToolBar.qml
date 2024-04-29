import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
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

                palette.button: "#D9D9D9"

                radius: 15
             }
        }
    }

import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4


ApplicationWindow {
    id: root

    width: 390
    height: 844
    visible: true

    header: CustomToolBar {
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: Window.width * 0.4
        MainMenuButtons {
            id: mainMenuButton
        }

        RestaurantField {
            id: field
        }
    }
}

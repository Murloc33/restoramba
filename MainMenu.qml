import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4
Page {
    id: mainMenu
    header: CustomToolBar {
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: Window.width * 0.2

        MainMenuButtons {
            id: mainMenuButton
        }

        RestaurantField {
            id: field
        }
    }


}

import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray

Item {
  id: root

  required property SystemTrayItem modelData
  required property int index

  implicitWidth: 15
  implicitHeight: 15

  Popup {
    id: trayMenuPopup
    contentWidth: 300
        contentHeight: idMenu.contentHeight
        modal: true
	focus: true
        popupType: Popup.Window
	background: Rectangle {
	    color: "#201d2a"
            border {
                color: "#201d2a"
                width: 2
            }
        }

        contentItem: TrayItemMenu {
            id: idMenu
            rootMenu: QsMenuOpener { menu: modelData.menu }
            trayMenu: QsMenuOpener { menu: modelData.menu }
        }

        onClosed: {
            idMenu.trayMenu = idMenu.rootMenu
        }
    }

    MouseArea {
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        anchors.fill: parent

        onClicked: event => {
            if (event.button === Qt.LeftButton) {
                modelData.activate();
            } else if (event.button === Qt.RightButton) {
                idMenu.trayMenu.menu = root.modelData.menu
                trayMenuPopup.open();
            }
        }
    }

    IconImage {
        id: icon
        anchors.fill: parent
        asynchronous: true
        source: {
            let icon = root.modelData.icon;
            if (icon.includes("?path=")) {
                const [name, path] = icon.split("?path=");
                icon = `file://${path}/${name.slice(name.lastIndexOf("/") + 1)}`;
            }
            return icon;
        }
    }
}

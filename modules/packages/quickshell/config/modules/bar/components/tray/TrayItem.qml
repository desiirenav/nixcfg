import QtQuick
import qs.common
import Quickshell
import QtQuick.Controls
import Quickshell.Widgets
import Quickshell.Services.SystemTray

Item {
  id: root

  implicitWidth: 15
  implicitHeight: 15

  required property int index
  required property SystemTrayItem modelData

  readonly property string resolvedIcon: {
    const icon = modelData.icon;
    if (icon.includes("?path=")) {
      const [name, path] = icon.split("?path=");
      return `file://${path}/${name.slice(name.lastIndexOf("/") + 1)}`;
    }
    return icon;
  }

  Popup {
    id: trayMenuPopup
    modal: true
    focus: true
    contentWidth: 300
    popupType: Popup.Window
    contentHeight: menu.contentHeight

    background: Rectangle { color: Theme.base00 }

    contentItem: TrayItemMenu {
      id: menu
      rootMenu: QsMenuOpener { menu: root.modelData.menu }
      trayMenu: QsMenuOpener { menu: root.modelData.menu }
    }

    onClosed: menu.trayMenu = menu.rootMenu
  }

  MouseArea {
    anchors.fill: parent
    acceptedButtons: Qt.LeftButton | Qt.RightButton
    onClicked: event => {
      if (event.button === Qt.LeftButton) {
        modelData.activate();
      } else {
        menu.trayMenu.menu = root.modelData.menu;
        trayMenuPopup.open();
      }
    }
  }

  IconImage {
    asynchronous: true
    anchors.fill: parent
    source: root.resolvedIcon
  }
}

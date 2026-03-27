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

  Popup { 
    id: trayMenuPopup

    modal: true
    focus: true
    contentWidth: 300
    popupType: Popup.Window
    contentHeight: idMenu.contentHeight
    background: Rectangle {
      color: Theme.base00
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
    anchors.fill: parent
    acceptedButtons: Qt.LeftButton | Qt.RightButton

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
    asynchronous: true
    anchors.fill: parent
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

import QtQuick
import Quickshell
import QtQuick.Layouts
import Quickshell.Wayland

Loader {
  id: root
  active: false
  required property bool isLauncherShowed

  onIsLauncherShowed: {
    if (root.isLauncherShowed == true) {
	root.active = true
    }
  }
 
  sourceComponent: Variants {
    model: Quickshell.screens;

    PanelWindow {
      id: launcherWindow

      property var modelData
      screen: modelData

      anchors {
	top: true
	bottom: true
	left: true
	right: true
      }
    }
  }
}

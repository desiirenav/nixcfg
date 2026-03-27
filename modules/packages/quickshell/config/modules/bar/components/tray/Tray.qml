import QtQuick
import Quickshell
import qs.common
import QtQuick.Layouts
import Quickshell.Services.SystemTray

Item {
  id: tray

  readonly property Repeater items: items

  clip: true
  visible: width > 0 && height > 0 // To avoid warnings about being visible with no size

  anchors.verticalCenter: parent.verticalCenter

  implicitWidth: layout.implicitWidth + (layout.implicitWidth * 0.35)
  implicitHeight: 30

  Row {
    id: layout
    anchors.centerIn: parent
    spacing: 5

    Repeater {
      id: items

      model: ScriptModel { values: [...SystemTray.items.values] }

      TrayItem { }
    }
  }
}

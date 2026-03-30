import QtQuick
import Quickshell
import qs.common
import Quickshell.Services.SystemTray

Item {
  id: tray

  readonly property Repeater items: items
  clip: true
  visible: items.count > 0
  anchors.verticalCenter: parent.verticalCenter
  implicitWidth: items.count > 0 ? layout.implicitWidth + 10 : 0
  implicitHeight: 30

  Row {
    id: layout
    anchors.centerIn: parent
    spacing: 5

    Repeater {
      id: items
      model: ScriptModel { values: [...SystemTray.items.values] }
      TrayItem {}
    }
  }
}

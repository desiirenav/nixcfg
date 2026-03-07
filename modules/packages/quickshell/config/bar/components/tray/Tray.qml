import QtQuick
import Quickshell
import QtQuick.Layouts
import Quickshell.Services.SystemTray

Item {
  anchors.right: parent.right
  anchors.rightMargin: 20
  id: root

  readonly property Repeater items: items

  clip: true
  visible: width > 0 && height > 0 // To avoid warnings about being visible with no size

  implicitWidth: layout.implicitWidth
  implicitHeight: layout.implicitHeight

  RowLayout {
    id: layout

    spacing: 4

    Repeater {
      id: items

      model: ScriptModel { values: [...SystemTray.items.values] }

      TrayItem { }
    }
  }
}

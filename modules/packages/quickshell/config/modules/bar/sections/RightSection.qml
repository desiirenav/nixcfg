import QtQuick
import Quickshell
import QtQuick.Layouts
import qs.modules.bar.components
import qs.modules.bar.components.tray

RowLayout {
  spacing: 0
  Layout.alignment: Qt.AlignRight | Qt.AlignVCenter

  Brightness {}
  Audio {}
  Battery {}
  Clock {}
  Tray {}
}

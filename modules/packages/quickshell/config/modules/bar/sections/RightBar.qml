import QtQuick
import Quickshell
import QtQuick.Layouts
import qs.modules.bar.components
import qs.modules.bar.components.tray

RowLayout {
  spacing: 0
  Layout.alignment: Qt.AlignRight | Qt.AlignVCenter

  // Center
  Niri { trayWidth: tray.implicitWidth }

  // Right
  Light {}
  Audio {}
  Power {}
  Clock {}
  Tray { 
    id: tray 
  }
}

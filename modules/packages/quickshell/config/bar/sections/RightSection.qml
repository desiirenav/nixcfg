import QtQuick
import Quickshell
import QtQuick.Layouts
import qs.bar.components
import qs.bar.components.tray

RowLayout {
  spacing: 40
  anchors {
    rightMargin: 5
    leftMargin: 5
    right: parent.right
    verticalCenter: parent.verticalCenter
  }
  Battery {}
  Tray {}
}

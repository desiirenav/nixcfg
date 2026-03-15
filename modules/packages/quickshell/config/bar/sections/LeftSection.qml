import QtQuick
import Quickshell
import QtQuick.Layouts
import qs.bar.components

RowLayout {
  spacing: 15
  anchors { 
    leftMargin: 10
    left: parent.left
    verticalCenter: parent.verticalCenter
  }
  Nix {}
  Time {}
//  Workspaces {}
}

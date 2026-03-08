import QtQuick
import Quickshell
import QtQuick.Layouts
import qs.bar.components

RowLayout {
  spacing: 15
  anchors { 
    leftMargin: 15
    rightMargin: 20
    topMargin: 20
    bottomMargin: 20
    left: parent.left
    verticalCenter: parent.verticalCenter
  }
  Nix {}
  Time {}
}

import QtQuick
import Quickshell
import qs.Bar

PanelWindow {
  color: "transparent"

  anchors {
    top: true
    left: false
    right: false
  }

  implicitHeight: 40

  Rectangle {
    anchors.fill: parent
    radius: 15
    topRightRadius: 0
    topLeftRadius: 0
    color: Colors.bg
    border { 
      color: Color.brd
      width: 3
    }
  }
}

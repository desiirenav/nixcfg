import Quickshell // for PanelWindow
import QtQuick // for Text
import qs.Bar
import qs.Widgets.Date

PanelWindow {
  color: "transparent"
  anchors {
    top: true
    left: false
    right: false
  }

  implicitHeight: 40

  Rectangle {    // match the size of the window
    anchors.fill: parent
    radius: 5
    color: Colors.bg // your actual color
    ClockWidget {
      anchors.centerIn: parent
    }
  }
}

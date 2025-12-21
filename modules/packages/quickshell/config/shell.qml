import Quickshell // for PanelWindow
import QtQuick // for Text
import qs.Bar
import qs.Clock

PanelWindow {
  color: "transparent"
  anchors {
    top: true
    left: false
    right: false
  }

  implicitHeight: 30

  Rectangle {    // match the size of the window
    anchors.fill: parent
    radius: 5
    color: Colors.bg // your actual color
    clockWidget {
      anchors.centerIn: parent
      time: Clock.time	
    }
  }
}

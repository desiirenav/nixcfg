import Quickshell // for PanelWindow
import QtQuick // for Text

PanelWindow {
  property color bg: "#201d2a"
  property color txt: "#efebff"
  anchors {
    top: true
    left: false
    right: false
  }
  color: bg

  margins {
    top: 10
  }

  implicitHeight: 30

  Text {
    anchors.centerIn: parent
    color: txt
    text: "hello world"
  }
}

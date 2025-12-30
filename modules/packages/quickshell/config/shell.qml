import QtQuick
import qs.Modules
import Quickshell
import QtQuick.Layouts

ShellRoot {
  Variants {
    model: Quickshell.screens
    delegate: PanelWindow {
      color: "transparent"
      implicitHeight: 40
      implicitWidth: 600

      anchors {
        top: true  
	left: false
	right: false
      }
      Rectangle {
	anchors.fill: parent
        radius: 60
	topRightRadius: 0
	topLeftRadius: 0
	color: Colors.bg
	Time {}
	Sound {}
	Battery {}
      }
    }
  }
}

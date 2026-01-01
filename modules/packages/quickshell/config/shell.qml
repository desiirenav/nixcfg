import QtQuick
import qs.Modules
import Quickshell
import QtQuick.Layouts

ShellRoot {
  Variants {
    model: Quickshell.screens
    delegate: PanelWindow {
      color: "transparent"
      implicitHeight: 50
      implicitWidth: 750
      anchors {
        top: true  
	left: false
	right: false
      }
      Rectangle {
	anchors.fill: parent
        radius: 30
	topRightRadius: 0
	topLeftRadius: 0
	color: Colors.bg1
	Time {}
	Sound {}
	Battery {}
      }
    }
  }
}

import QtQuick
import Quickshell
import qs.bar.sections
import QtQuick.Layouts
import qs.bar.components
import Quickshell.Wayland

Scope {
  Variants {
    model: Quickshell.screens

    
    delegate: PanelWindow {
      id: bar

      color: "transparent"
      implicitHeight: 35


      anchors {
	top: false
        left: true
	right: true
	bottom: true
      }


      Rectangle {
	color: "#201d2a"

	anchors {
	  fill: parent
        }

	RowLayout {
	  anchors.fill: parent
	}
      } 
 
    }
  }
}

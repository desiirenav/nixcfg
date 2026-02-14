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
      implicitHeight: 50
      implicitWidth: 500


      anchors {
        top: true
        left: false
        right: false
      }


      Rectangle {
	radius: 20
	color: "#201d2a"

	anchors {
	  fill: parent
	  topMargin: 10
        }

	RowLayout {
	  anchors.fill: parent
	  LeftSection {}
	  CenterSection {}
	  RightSection {}
	}
      }
  
 
    }
  }
}

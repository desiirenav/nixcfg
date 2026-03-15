import QtQuick
import Quickshell
import qs.bar.sections
import QtQuick.Effects
import QtQuick.Layouts
import qs.bar.components
import Quickshell.Wayland

Scope {
  Variants {
    model: Quickshell.screens

    
    delegate: PanelWindow {
      id: panel

      color: "transparent"
      implicitHeight: 30


      anchors {
        top: false
        left: true
	right: true
	bottom: true
      }


      Rectangle {
	id: bar
	color: "#201d2a"

	anchors {
	  fill: parent
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

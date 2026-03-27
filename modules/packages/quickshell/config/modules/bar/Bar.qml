import QtQuick
import qs.common
import Quickshell
import QtQuick.Effects
import QtQuick.Layouts
import Quickshell.Wayland
import qs.modules.bar.sections

Scope {
  Variants {
    model: Quickshell.screens
    delegate: PanelWindow {
      screen: modelData
      aboveWindows: false
      color: "transparent"
      required property var modelData
      implicitHeight: 30
       
      anchors {

	left: true
        right: true
	bottom: true
      }


      Rectangle {
	id: bar
	color: Theme.base00
	anchors {
	  fill: parent
        }
	RowLayout {
	  spacing: 0
	  anchors.fill: parent
	  LeftSection {}
	  CenterSection {}
	  RightSection {}
	}
      }
    }
  }
}

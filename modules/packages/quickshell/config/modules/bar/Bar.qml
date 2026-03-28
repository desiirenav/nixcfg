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
      margins.top: 5
      anchors.top: true
      screen: modelData
      implicitHeight: 35
      implicitWidth: 700
      color: "transparent"
      required property var modelData

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

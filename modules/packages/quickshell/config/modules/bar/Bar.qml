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
      required property var modelData
      screen: modelData
      implicitHeight: 30
      implicitWidth: 800
      aboveWindows: false
      color: "transparent"

      anchors {
        top: true
      }
      
      margins {
	top: 5
      }

      Rectangle {
        radius: 5
        clip: true
        anchors.fill: parent
        color: Theme.base00

        RowLayout {
          anchors.fill: parent
          anchors.leftMargin: 5
          anchors.rightMargin: 0
	  LeftBar {}
	  RightBar {}
        }
      }
    }
  }
}

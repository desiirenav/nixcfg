import QtQuick
import qs.common
import Quickshell
import QtQuick.Effects
import QtQuick.Layouts
import Quickshell.Wayland
import qs.modules.bar.workspaces

Variants {
  model: Quickshell.screens
  
  PanelWindow { 
    screen: modelData
    implicitWidth: 400
    implicitHeight: 50
    color: "transparent"
    required property var modelData

    anchors {
      top: true
      left: false
      right: false
    }


    RectangularShadow {
      anchors.fill: bar
      radius: bar.radius
      blur: 10
    }

    Rectangle {
      id: bar
      radius: 20
      color: Theme.base00

      anchors {
	topMargin: 10
	fill: parent
      }

      // Left
      RowLayout {
	anchors {
	  left: parent.left
	  verticalCenter: parent.verticalCenter
        }
        Time {}
      }

      // Center
      RowLayout { 
	anchors.centerIn: parent 
      }

      // Right
      RowLayout { 
	anchors { 
	  right: parent.right
          verticalCenter: parent.verticalCenter
	}
      }
    }
  }
}

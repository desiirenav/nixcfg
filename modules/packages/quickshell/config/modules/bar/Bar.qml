import QtQuick
import qs.common
import Quickshell
import QtQuick.Layouts
import Quickshell.Wayland
import qs.modules.bar.widgets

Variants {
  model: Quickshell.screens
  delegate: PanelWindow { 
    color: "transparent"
    implicitHeight: 50
    implicitWidth: 500

    anchors {
      top: true
      left: false
      right: false
    } 

    Rectangle { 
      radius: 50
      color: Theme.base00

      anchors {
	fill: parent
        topMargin: 5
      } 

      RowLayout { 
	anchors { 
	  left: parent.left
          verticalCenter: parent.verticalCenter
        } 

	Time {}
        
      } 

      RowLayout { 
	anchors.centerIn: parent
        Workspaces {}
      }

      RowLayout { 
	anchors { 
	  right: parent.right
	  verticalCenter: parent.verticalCenter 
          rightMargin: 10
        } 

	Battery {}
      } 

    }
  }
}

import Quickshell
import Quickshell.Wayland
import QtQuick

Item {
  id: root
  implicitWidth: 90
  implicitHeight: 30

  Rectangle {
    implicitWidth: parent.implicitWidth
    implicitHeight: parent.implicitHeight
    anchors.left: parent.left
    anchors.verticalCenter: parent.verticalCenter 
    radius: 20
    color: Colors.bg2
    Repeater { 
      id: wsRepeater
      anchors.centerIn: parent
      Rectangle { 
	id: workspaceNumber
	width: 20
	height: 20
	radius: 20
        
	color: MangoWC.currentWorkspace ? Colors.bg1: "transparent"

	Text { 
	  color: Colors.txt
	  font { 
	    bold: true
	    pixelSize: 12
          }
          text: MangoWC.currentWorkspace
        }
      }
    }
  }
}


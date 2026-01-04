import Quickshell
import Quickshell.Wayland
import QtQuick

Item {
  id: root
  implicitWidth: 90
  implicitHeight: 30
  readonly property Toplevel activeWindow: ToplevelManager.activeToplevel

  Rectangle {
    implicitWidth: parent.implicitWidth
    implicitHeight: parent.implicitHeight
    anchors.left: parent.left
    anchors.verticalCenter: parent.verticalCenter 
    radius: 20
    color: Colors.bg2
    Rectangle {
      anchors.left: parent.left
      anchors.verticalCenter: parent.verticalCenter 
      color: Colors.bg7
      implicitWidth: 30
      implicitHeight: 30
      radius: 30
      Text {
	anchors.centerIn: parent
        color: Colors.txt
        font {
          pointSize: 11
	  weight: 600
        }
        text: MangoService.currentWorkspace
      }
    }
    Text {
      anchors.left: parent.left
      anchors.leftMargin: 40
      anchors.verticalCenter: parent.verticalCenter
      color: Colors.txt
      text: activeWindow?.activated?activeWindow?.appId : "desktop"
      font { 
	pointSize: 11
        weight: 600
      }
    }
  }
}


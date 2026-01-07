import QtQuick
import Quickshell
import Quickshell.Io
import QtQuick.Layouts
pragma ComponentBehavior: Bound

Item {
  Rectangle {
    id: root
    property var workspaces: Mango.workspaces
    color: Colors.bg2
    implicitHeight: 25
    width: 25
    radius: 25
    Row {
     id: workRow
     anchors.fill: parent
     spacing: 2
     Repeater { 
       id: workspacePill
       model: 5
       delegate: Rectangle { 
	 required property int modelData
	 id: pill
	 color: Colors.bg2
	 implicitWidth: 25
	 implicitHeight: 25
	 radius: 25
	 MouseArea { 
	   anchors.fill: pill
	   hoverEnabled: true
	   cursorShape: Qt.PointingHandCursor
	   acceptedButtons: Qt.LeftButton
	   onClicked: changeWorkspace.running = true
        } 
	Process {
	    id: changeWorkspace
	    command: ["mmsg","-t",modelData+1]
        }
	Text { 
	  id: workNum
	  anchors.centerIn: pill
	  color: modelData==Mango.currentWorkspace-1 ? Colors.bg2 : Colors.bg7
	  font { 
	    pixelSize: 12
	    weight: 600
          } 
          text: modelData + 1
	}
       }
     }
   }
 }
}

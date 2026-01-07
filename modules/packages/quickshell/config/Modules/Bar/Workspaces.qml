import QtQuick
import Quickshell
import Quickshell.Io
import QtQuick.Layouts
pragma ComponentBehavior: Bound

Item {
  id: root
  implicitWidth: 125
  implicitHeight: 20
  Rectangle {
    property var workspaces: Mango.workspaces
    color: Colors.bg1
    implicitWidth: parent.implicitWidth
    implicitHeight: parent.implicitHeight
    radius: 20
    RowLayout {
     id: workRow
     anchors.fill: parent
     spacing: 0
     Repeater { 
       id: workspacePill
       model: 5
       delegate: Rectangle { 
	 required property int modelData
	 id: pill
	 color: "transparent"
	 implicitWidth: 20
	 implicitHeight: 20
	 radius: 20
	 MouseArea { 
	   anchors.fill: parent
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
	  anchors.centerIn: parent
	  color: Colors.txt
	  font { 
	    pixelSize: 12
	    bold: true
          } 
          text: modelData + 1
	}
       }
     }
   }
 }
}

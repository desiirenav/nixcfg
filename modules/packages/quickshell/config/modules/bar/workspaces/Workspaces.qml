import QtQuick
import Quickshell
import QtQuick.Layouts

Item { 
  id: root
  implicitWidth: 200
  implicitHeight: 25
  Rectangle {
    implicitWidth: parent.implicitWidth
    implicitHeight: parent.implicitHeight
    color: "transparent"
    RowLayout { 
      anchors.centerIn: parent
      Repeater { 
	model:  5
	Rectangle { 
	  implicitWidth: 40
	  implicitHeight: 25
          radius: 20
	  color: "transparent"
	  Text {
	    anchors.centerIn: parent
            color: "blue"
            text: a
	  }
	}
      }
    }
  }
}

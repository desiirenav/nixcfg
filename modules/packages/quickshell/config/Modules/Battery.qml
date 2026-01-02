import QtQuick
import Quickshell
import QtQuick.Layouts
import Quickshell.Services.UPower

RowLayout {
  id: root
  anchors.right: parent.right
  anchors.verticalCenter: parent.verticalCenter 
  anchors.rightMargin: 10

  Rectangle {
    implicitWidth: 60
    implicitHeight: 25
    Layout.fillWidth: true
    radius: 15
    color: Colors.bg2
    Rectangle { 
      color: Colors.bg7
      implicitWidth: ((parent.width) * (Math.round(UPower.displayDevice.percentage * 100)))/100
      implicitHeight: parent.height
      radius: parent.radius
    }
    Row { 
      anchors.centerIn: parent
      Text {
        id: battery
        opacity: 1
        color: Colors.txt
        font {
          pointSize: 12
	  weight: 600
        }
        text: Math.round(UPower.displayDevice.percentage * 100)
      }
      Text {
      }
    }
  }
}

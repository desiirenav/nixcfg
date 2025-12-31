import QtQuick
import Quickshell
import QtQuick.Layouts
import Quickshell.Services.UPower

RowLayout {
  property string batper : { 
    if (UPowerDeviceState.Charging) 
	  return " " + Math.round(UPower.displayDevice.percentage * 100) + " %"
    else return Math.round(UPower.displayDevice.percentage * 100) + " %"
  }
  anchors.right: parent.right
  anchors.verticalCenter: parent.verticalCenter 
  anchors.rightMargin: 10
  Rectangle {
    implicitWidth: 75
    implicitHeight: 30
    Layout.fillWidth: true
    radius: 13
    color: Colors.bg2
    Rectangle { 
      color: Colors.bg7
      implicitWidth: ((parent.width) * (Math.round(UPower.displayDevice.percentage * 100)))/100
      implicitHeight: parent.height
      radius: parent.radius
    }
    Text {
      id: battery
      anchors.centerIn: parent
      opacity: 1
      color: Colors.txt
      font {
        pointSize: 12
	weight: 600
      }
      text: batper
    }
  }
}

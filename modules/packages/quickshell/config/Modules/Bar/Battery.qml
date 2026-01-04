pragma ComponentBehavior: Bound
import Quickshell.Services.UPower
import QtQuick
import QtQuick.Layouts

Item { 
  id: root
  implicitWidth: 45
  implicitHeight: 25
  property bool isCharging: UPower.displayDevice.state === UPowerDeviceState.Charging
  function getBatteryIcon() { 
    if (isCharging) {
      return "";
    }
    else return ""
  }
  Rectangle {
    implicitWidth: parent.implicitWidth
    implicitHeight: parent.implicitHeight
    radius: 20
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
        color: Colors.txt
        font {
          pointSize: 11
	  weight: 600
        }
        text: Math.round(UPower.displayDevice.percentage * 100)
      }
      Text {
	text: root.getBatteryIcon()
	color: Colors.txt
	font: { 
	  family: "Material Symbols Rounded"
          pointSize: 11
	}
      }
    }
  }
}

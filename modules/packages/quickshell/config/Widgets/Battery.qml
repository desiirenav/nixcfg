import QtQuick
import QtQuick.Layouts
pragma ComponentBehavior: Bound
import Quickshell.Services.UPower

Item { 
  id: root
  implicitWidth: 50
  implicitHeight: 30
  property bool isCharging: UPower.displayDevice.state === UPowerDeviceState.Charging
  function getBatteryIcon() {
    if (isCharging) {
      return "bolt";
    }
  }

  Rectangle {
    implicitWidth: parent.implicitWidth
    implicitHeight: parent.implicitHeight
    radius: 30
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
        color: Colors.txt
        font {
	  pointSize: 11
          bold: true
        }
        text: Math.round(UPower.displayDevice.percentage * 100)
      }
      Text { 
	color: Colors.txt
	text: root.getBatteryIcon()
        font {
          family: "Material Symbols Rounded"
          pointSize: 11
        }
      }
    }
  }
}

import QtQuick
import QtQuick.Layouts
import Quickshell.Services.UPower

Rectangle {
  radius: 15
  property bool isCharging: UPower.displayDevice.state === UPowerDeviceState.Charging
  color: "#4b455f"
  implicitWidth: 50
  implicitHeight: 30
  
  Rectangle { 
    color: "#7451e6"
    radius: parent.radius
    implicitHeight: parent.height
    implicitWidth: ((parent.width) * (Math.round(UPower.displayDevice.percentage * 100)))/100
  }

  RowLayout { 
    anchors.centerIn: parent
    Text { 
      color: "#efebff"
      text: Math.round(UPower.displayDevice.percentage * 100)
      font { 
	bold: true
	pointSize: 11
      }
    }
  }

}

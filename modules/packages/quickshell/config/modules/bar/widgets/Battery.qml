import QtQuick
import qs.common
import QtQuick.Layouts
import Quickshell.Services.UPower

Item { 
  id: root
  implicitWidth: 50
  implicitHeight: 30
  property bool isCharging: UPower.displayDevice.state === UPowerDeviceState.Charging
  Rectangle {
    implicitWidth: parent.implicitWidth
    implicitHeight: parent.implicitHeight
    radius: 50
    color: Theme.base02

    Rectangle { 
      color: Theme.base08
      implicitWidth: ((parent.width) * (Math.round(UPower.displayDevice.percentage * 100)))/100
      implicitHeight: parent.height
      radius: parent.radius
    }

    RowLayout { 
      anchors.centerIn: parent

      Text {
        color: Theme.base07
        text: Math.round(UPower.displayDevice.percentage * 100)
        font {
	  pointSize: 11
          bold: true
        }
      }
    }
  }
}

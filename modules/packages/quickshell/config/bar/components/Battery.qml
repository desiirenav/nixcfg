import QtQuick
import QtQuick.Layouts
import Quickshell.Services.UPower

Item {
  root
  implicitWidth: 50
  implicitHeight: 30
  property bool isCharging: UPower.displayDevice.state === UPowerDeviceState.Charging

  Rectangle {
    color: "#7451e6"
    implicitWidth: parent.width
    implicitHeight: parent.height
  }
}

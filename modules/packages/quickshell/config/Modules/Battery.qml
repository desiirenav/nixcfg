import QtQuick
import Quickshell
import QtQuick.Layouts
import Quickshell.Services.UPower

RowLayout {
  anchors.verticalCenter: parent.verticalCenter 
  Rectangle {
    Layout.preferredWidth: 160
    Layout.preferredHeight: 30
    radius: 25
    color: Colors.brd
    Text {
      anchors.centerIn: parent 
      text: Math.round( UPower.displayDevice.percentage * 100) + "%"
    }
  }
}

import QtQuick
import Quickshell
import QtQuick.Layouts
import Quickshell.Services.UPower

RowLayout {
  anchors.right: parent.right
  anchors.verticalCenter: parent.verticalCenter 
  anchors.rightMargin: 10
  Rectangle {
    Layout.preferredWidth: 75
    Layout.preferredHeight: 30
    radius: 13
    color: Colors.brd
    Text {
      id: battery
      anchors.centerIn: parent
      color: Colors.txt
      opacity: 1
      font {
        pointSize: 12
	weight: 600
      }
      text: Math.round( UPower.displayDevice.percentage * 100) + " %"
    }
  }
}

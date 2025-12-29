import QtQuick
import Quickshell
import qs.Modules
import QtQuick.Layouts

RowLayout {
  anchors.centerIn: parent

  Rectangle {
    Layout.preferredWidth: 160
    Layout.preferredHeight: 30
    radius: 13
    color: Colors.brd
    Text {
      id: clock
      anchors.centerIn: parent
      color: Colors.txt
      opacity: 1
      font {
	pointSize: 12
        weight: 600
      }
      text: Qt.formatDateTime(new Date(), "ddd, MMM dd  HH:mm")
      Timer {
	interval: 1000
        running: true
	repeat: true
        onTriggered: clock.text = Qt.formatDateTime(new Date(), "ddd, MMM dd  HH:mm")
      }
    }
  }
}

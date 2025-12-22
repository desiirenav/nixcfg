import QtQuick
import Quickshell
import qs.Modules
import QtQuick.Layouts

RowLayout {
  anchors.centerIn: parent

  Rectangle {
    Layout.preferredWidth: 100
    Layout.preferredHeight: 30
    radius: 25
    color: Colors.brd
    Text {
      id: clock
      anchors.centerIn: parent
      color: Colors.txt
      font {
        pointSize: 12
	bold: true
      }
      text: Qt.formatDateTime(new Date(), "HH:mm:ss")
      Timer {
	interval: 1000
        running: true
	repeat: true
        onTriggered: clock.text = Qt.formatDateTime(new Date(), "HH:mm:ss")
      }
    }
  }
}

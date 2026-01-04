import QtQuick
import Quickshell
import QtQuick.Layouts

Item {
  property alias enabled: clock.enabled
  readonly property date date: clock.date

  function format(fmt: string): string {
    return Qt.formatDateTime(clock.date, fmt);
  }

  SystemClock {
    id: clock
    precision: SystemClock.Seconds
  }
  Column { 
    anchors.left: parent.left
    anchors.verticalCenter: parent.verticalCenter
    Text { 
      anchors.left: parent.left
      anchors.leftMargin: 10
      color: Colors.txt
      text: Qt.formatDateTime(clock.date, "HH:mm")
      font {
	pointSize: 13
        bold: true
      }
    }
    Text { 
      anchors.left: parent.left
      anchors.leftMargin: 2
      text: Qt.formatDateTime(clock.date, "ddd,  MMM dd") 
      color: Colors.txt
      font {
	pointSize: 9
        weight: 500
      }
    }
  }
}

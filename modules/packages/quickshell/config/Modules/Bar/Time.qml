import QtQuick
import Quickshell
import QtQuick.Layouts

RowLayout { 
  property alias enabled: clock.enabled
  readonly property date date: clock.date

  function format(fmt: string): string {
    return Qt.formatDateTime(clock.date, fmt);
  }

  SystemClock {
    id: clock
    precision: SystemClock.Seconds
  }

  anchors.left: parent.left
  anchors.verticalCenter: parent.verticalCenter 
  anchors.leftMargin: 15
  Column { 
    Text { 
      text: Qt.formatDateTime(clock.date, "HH:mm") 
      color: Colors.txt 
      font { 
	pointSize: 11
        bold: true
      }
    }
    Text { 
      text: Qt.formatDateTime(clock.date, "ddd, MMM dd") 
      color: Colors.txt
      font { 
	pixelSize: 12
        weight: 500
      }
    }
  }
}

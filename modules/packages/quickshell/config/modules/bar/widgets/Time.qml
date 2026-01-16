import QtQuick
import qs.common
import Quickshell
import QtQuick.Layouts

Item {
  id: root

  property alias enabled: clock.enabled
  readonly property date date: clock.date

  function format(fmt: string): string {
    return Qt.formatDateTime(clock.date, fmt);
  }

  SystemClock {
    id: clock
    precision: SystemClock.Seconds
  }

  ColumnLayout {
    anchors {
      left: parent.left
      verticalCenter: parent.verticalCenter
    }
    spacing: 0
    Text {
      color: Theme.base07		  
      text: Qt.formatDateTime(clock.date, "HH:mm")
      font { 
	pointSize: 10
        bold: true
      }
    } 
    Text { 
      color: Theme.base07	    
      text:  Qt.formatDateTime(clock.date, "ddd, MMM dd") 
      font { 
	pixelSize: 10
        bold: true
      }
    }
  }
}

import QtQuick
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
      leftMargin: 15
    }
    spacing: 0
    Text {
      color: "#efebff"		  
      text: Qt.formatDateTime(clock.date, "HH:mm")
      font { 
	pointSize: 10
        bold: true
      }
    } 
    Text { 
      color: "#efebff"	    
      text: Qt.formatDateTime(clock.date, "ddd, MMM dd") 
      font { 
	pixelSize: 10
        bold: true
      }
    }
  }
}

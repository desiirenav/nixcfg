import QtQuick
import Quickshell
import QtQuick.Layouts

Rectangle {
  radius: 5
  color: "transparent"
  implicitHeight: 30
  implicitWidth: 60
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
    anchors {
      left: parent.left
      verticalCenter: parent.verticalCenter
    }
    spacing: 0
    Text {
      color: "#efebff"		  
      text: Qt.formatDateTime(clock.date, "HH:mm")
      font { 
	pixelSize: 11
        bold: true
      }
    } 
    Text { 
      color: "#efebff"	    
      text:  Qt.formatDateTime(clock.date, "ddd, MMM dd") 
      font { 
	pixelSize: 10
        bold: true
      }
    }
  }
}

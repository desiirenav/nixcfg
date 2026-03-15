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

  RowLayout {
    anchors {
      verticalCenter: parent.verticalCenter
    }
    spacing: 10
    Text {
      color: "#efebff"		  
      text: Qt.formatDateTime(clock.date, "HH:mm")
      font { 
        family: "Liga SFMono Nerd Font"
	pointSize: 11
        bold: true
      }
    } 
    Text { 
      color: "#efebff"	    
      text:  Qt.formatDateTime(clock.date, "ddd, MMM dd") 
      font { 
	pointSize: 11
        family: "Liga SFMono Nerd Font"
        bold: true
      }
    }
  }
}

import QtQuick
import Quickshell
import qs.Modules
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
  anchors.leftMargin: 20
   Column { 
     Text { 
       color: Colors.txt
       text:  Qt.formatDateTime(clock.date, "HH:mm")
       font {
	 bold: true       
 	 pixelSize: 18
       }
     } 
     Text { 
       color: Colors.txt
       text:  Qt.formatDateTime(clock.date, "ddd, dd/MM")
       font { 
	 pixelSize: 12
       }
     }
   } 
}

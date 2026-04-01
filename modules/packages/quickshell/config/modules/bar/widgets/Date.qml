import QtQuick
import Quickshell
import qs.reusables
import QtQuick.Layouts
import Quickshell.Services.UPower

CustomText {
  anchors { 
    verticalCenter: parent.verticalCenter
  }
  SystemClock {
    id: clock
    precision: SystemClock.Seconds
  }
  text: Qt.formatDateTime(clock.date, "ddd, dd MMM yyyy")
}

import QtQuick
import qs.common
import Quickshell
import QtQuick.Layouts
import Quickshell.Services.UPower

Widget {
  implicitWidth: 100
  color: Theme.base08
  SystemClock {
    id: clock
    precision: SystemClock.Seconds
  }
  CustomText { 
    anchors.centerIn: parent
    text: Qt.formatDateTime(clock.date, "HH:mm A")
  }
}

import QtQuick
import Quickshell
import qs.reusables
import QtQuick.Layouts

Widget {
  implicitWidth: 69
  topRightRadius: 3
  color: Theme.base08
  bottomRightRadius: 3
  SystemClock {
    id: clock
    precision: SystemClock.Seconds
  }
  CustomText { 
    anchors.centerIn: parent
    text: Qt.formatDateTime(clock.date, "HH:mm")
  }
}

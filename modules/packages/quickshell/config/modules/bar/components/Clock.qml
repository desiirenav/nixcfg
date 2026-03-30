import QtQuick
import qs.common
import Quickshell

Widget {
  implicitWidth: 70
  color: Theme.base08

  SystemClock {
    id: clock
    precision: SystemClock.Seconds
  }

  CText {
    anchors.centerIn: parent
    text: Qt.formatDateTime(clock.date, "HH:mm")
  }
}

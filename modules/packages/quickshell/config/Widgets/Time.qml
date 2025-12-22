import Quickshell // for PanelWindow
import QtQuick // for Text

Text {
  text: Qt.formatDateTime(new Date(), "ddd, MMM dd - HH:mm")

  Timer {
    interval: 1000
    running: true
    repeat: true
    onTriggered: clock.text = Qt.formatDateTime(new Date(), "ddd, MMM dd - HH:mm")
  }
}

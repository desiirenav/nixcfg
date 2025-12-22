import Quickshell // for PanelWindow
import QtQuick // for Text
import qs.Bar

Rectangle {
  anchors.fill: parent
  border {
    color: Colors.bdr
    width: 5
  }

  Text {
    text: Qt.formatDateTime(new Date(), "HH:mm")
    font.pointSize: 12
    font.bold: true
    anchors.centerIn: parent
    color: Colors.txt
    Timer {
      interval: 1000
      running: true
      repeat: true
      onTriggered: clock.text = Qt.formatDateTime(new Date(), "HH:mm")
    }
  }
}

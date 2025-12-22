import Quickshell
import QtQuick
import qs.Bar

Rectangle {
  anchors.fill: parent
  Text {
    text: Time.time
    color: Colors.txt
    font.pointSize: 12
    font.bold: true
  }
}

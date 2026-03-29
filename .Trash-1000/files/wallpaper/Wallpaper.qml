import QtQuick
import Quickshell

Window {
  id: root

  visible: true
  flags: Qt.FramelessWindowHint | Qt.WindowStaysOnBottomHint

  width: Screen.width
  height: Screen.height

  x: 0
  y: 0

  Image {
    asynchronous: true
    anchors.fill: parent
    fillMode: Image.PreserveAspectCrop
    source: Qt.resolvedUrl("./pattern.png")
  }
}

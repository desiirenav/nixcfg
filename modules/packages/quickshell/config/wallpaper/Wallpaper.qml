import QtQuick
import Quickshell
import Quickshell.Wayland

PanelWindow {
  id: root

  screen: modelData
  required property var modelData
  exclusionMode: ExclusionMode.Ignore
  WlrLayershell.layer: WlrLayer.Background

  anchors {
    top: true
    left: true
    right: true
    bottom: true
  }

  Image {
    asynchronous: true
    anchors.fill: parent
    fillMode: Image.PreserveAspectCrop
    source: Qt.resolvedUrl("./pattern.png")
  }
}

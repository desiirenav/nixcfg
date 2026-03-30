import QtQuick
import Quickshell
import Quickshell.Wayland

Scope {
  Variants {
    model: Quickshell.screens

    delegate: PanelWindow {
      id: root

      required property var modelData
      screen: modelData
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
        source: Qt.resolvedUrl("./pictures/sky.jpg")
      }
    }
  }
}

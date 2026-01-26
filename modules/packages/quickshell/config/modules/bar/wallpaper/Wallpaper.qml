import QtQuick
import Quickshell
import Quickshell.Wayland

PanelWindow {
    id: root

    required property var modelData

    screen: modelData

    anchors {
        top: true
        left: true
        right: true
        bottom: true
    }

    exclusionMode: ExclusionMode.Ignore

    WlrLayershell.layer: WlrLayer.Background

    Image {
        anchors.fill: parent

        asynchronous: true

        fillMode: Image.PreserveAspectCrop

        source: Qt.resolvedUrl("./../../pictures/night.png")
    }
}

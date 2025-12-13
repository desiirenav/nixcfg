import QtQuick
import QtQuick.Layouts
import Quickshell

PanelWindow {
    id: bar

    property color theme00: "#faf4ed"
    property color theme01: "#fffaf3"
    property color theme02: "#f2e9de"
    property color theme03: "#9893a5"
    property color theme04: "#797593"
    property color theme05: "#575279"
    property color theme06: "#575279"
    property color theme07: "#cecacd"
    property color theme08: "#b4637a"
    property color theme09: "#ea9d34"
    property color theme0A: "#d7827e"
    property color theme0B: "#286983"
    property color theme0C: "#56949f"
    property color theme0D: "#907aa9"
    property color theme0E: "#ea9d34"
    property color theme0F: "#cecacd"


    anchors {
        top: true
        left: true
        right: true
    }
    implicitHeight: 30
    color: "transparent"

    Rectangle {
        anchors.fill: parent
        color: theme00
        bottomLeftRadius: 20
        bottomRightRadius: 20
        // left
        RowLayout {
            anchors {
                left: parent.left
                leftMargin: 50
            }
            Loader { active: true; sourceComponent: Workspaces {} }
        }
        // center
        RowLayout {
            anchors {
                horizontalCenter: parent.horizontalCenter
                verticalCenter: parent.verticalCenter
            }

            Text {
                text: niri.focusedWindow?.title ?? ""
                font.pixelSize: 16
                color: theme05
            }
        }
        // right
        RowLayout {
            anchors {
                verticalCenter: parent.verticalCenter
                right: parent.right
                rightMargin: 25
            }
            spacing: 10
            Loader { active: true; sourceComponent: Power {} }
            Loader { active: true; sourceComponent: Time {} }
        }
    }
}

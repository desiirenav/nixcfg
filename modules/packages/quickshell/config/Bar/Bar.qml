import QtQuick
import Quickshell
import qs.Bar
import qs.Widgets
import QtQuick.Layouts

PanelWindow {
  color: "transparent"

  anchors {
    top: true
    left: false
    right: false
  }
  
  implicitHeight: 40
  implicitWidth: 500

  Rectangle {
    anchors.fill: parent
    radius: 15
    topRightRadius: 0
    topLeftRadius: 0
    color: Colors.bg
  }

  RowLayout {
    spacing: 0
    anchors.fill: parent

    RowLayout {
      spacing: 10
      Layout.alignment: Qt.AlignLeft
      Layout.fillWidth: true
    }

    RowLayout {
      spacing: 10
      Layout.alignment: Qt.AlignCenter
      Layout.fillWidth: true
      Time {
        anchors.centerIn: parent
      }
    }

    RowLayout {
      spacing: 10
      Layout.alignment: Qt.AlignRight
      Layout.fillWidth: true
    }
  }
}

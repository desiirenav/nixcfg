import QtQuick
import Quickshell
import QtQuick.Layouts

Item {
  id: root
  implicitWidth: 125
  implicitHeight: 30
  Rectangle {
    color: "transparent"
    implicitWidth: parent.implicitWidth
    implicitHeight: parent.implicitHeight
    radius: 30
    RowLayout {
      anchors.centerIn: parent
    }
  }
}

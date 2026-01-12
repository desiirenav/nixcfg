import QtQuick
import qs.Widgets
import Quickshell
import QtQuick.Layouts
import Quickshell.Wayland

PanelWindow { 
  id: root
  color: "transparent"
  implicitHeight: 50
  implicitWidth: 500

  anchors { 
    top: true
    left: false
    right: false
  }
  Rectangle {
    anchors.fill: parent
    anchors.topMargin: 5
    radius: 20
    color: Colors.bg1

    RowLayout {
      id: leftLayout
      anchors.left: parent.left
      anchors.verticalCenter: parent.verticalCenter 
      Time {}
    }

    RowLayout { 
      id: centerLayout
      anchors.centerIn: parent
    }

    RowLayout { 
      id: rightLayout
      anchors.right: parent.right
      anchors.verticalCenter: parent.verticalCenter
      anchors.rightMargin: 10
      spacing: 10
      Battery {}
    }
  }
}

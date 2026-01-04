import QtQuick
import Quickshell
import QtQuick.Layouts
import Quickshell.Wayland

PanelWindow { 
  id: root
  required property var modelData
  WlrLayershell.layer: WlrLayer.Background
  color: "transparent"
  implicitHeight: 45
  implicitWidth: 750

  anchors { 
    top: true
    left: false
    right: false
  }
  Rectangle {
    anchors.fill: parent
    radius: 20
    topLeftRadius: 0
    topRightRadius: 0
    color: Colors.bg1

    RowLayout {
      id: leftLayout
      anchors.left: parent.left
      anchors.verticalCenter: parent.verticalCenter 
      anchors.leftMargin: 10
      Time {}
    }

    RowLayout { 
      id: centerLayout
      anchors.centerIn: parent
      Workspaces {}
    }

    RowLayout { 
      id: rightLayout
      anchors.right: parent.right
      anchors.verticalCenter: parent.verticalCenter
      anchors.rightMargin: 10
      spacing: 20
      Loader {
	sourceComponent: Volume {}
      }
      Loader {
	sourceComponent: Battery {}
      }
    }
  }
}

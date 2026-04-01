import QtQuick
import Quickshell
import qs.reusables
import QtQuick.Effects
import QtQuick.Layouts
import Quickshell.Wayland
import qs.modules.bar.widgets

Scope { 
  Variants {
    model: Quickshell.screens
    delegate: PanelWindow {
      screen: modelData
      aboveWindows: false
      color: "transparent"
      required property var modelData

      margins.top: 9
      anchors.top: true
      implicitHeight: 30
      implicitWidth: 720

      Rectangle {
        radius: 6
	color: Theme.base00
        anchors.fill: parent

	RowLayout { 
	  spacing: 0
	  anchors.fill: parent

	  RowLayout {
	    spacing: 9
	    Layout.leftMargin: 12
	    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter

	    Logo {}
	    Date {}
	    Niri {}
	  }

	  RowLayout {
	    spacing: 0
	    Layout.rightMargin: 0
	    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            
	    Light {}
	    Audio {}
	    Battery {}
	    Clock {}

	  }

	}
      }
    }
  }
}

import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import Quickshell.Services.SystemTray

import QtQuick
import QtQuick.Layouts


Rectangle {
  id: root
  property var bar
	
  visible: SystemTray.items.values.length
  color: "transparent"
  RowLayout {
    anchors.centerIn: parent
    spacing: 10
		
    Repeater {
      model: SystemTray.items
			
      delegate: Rectangle {
	id: sysItem
	required property var modelData
	Layout.alignment: Qt.AlignCenter
	height: 20
	width: 20
	color: "transparent"

	IconImage {
	  anchors.centerIn: parent
	  width: 20
	  height: 20
	  source: modelData.icon
	}
				
	QsMenuAnchor {
	  id: menu

	  menu: sysItem.modelData.menu
	  anchor.item: sysItem
	}

	MouseArea {
	  anchors.fill: parent
					
	  acceptedButtons: Qt.LeftButton | Qt.RightButton
					
	  onClicked: event => {
	    if (event.button === Qt.LeftButton)
	       modelData.activate();
	    else if (modelData.hasMenu)
		 menu.open();
	  }
	}
      }
    }
  }
}

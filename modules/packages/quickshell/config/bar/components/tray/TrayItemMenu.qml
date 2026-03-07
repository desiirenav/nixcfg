pragma ComponentBehavior: Bound

import Quickshell
import QtQuick
import QtQuick.Layouts

ListView {
  id: view 

  required property QsMenuOpener rootMenu
  required property QsMenuOpener trayMenu
  
  width: contentWidth
  height: contentHeight

  anchors.fill: parent 
  spacing: 10

  model: ScriptModel {
    values: [...trayMenu?.children.values]
  }

  delegate: Rectangle {
    property var rectColor: mouse.hovered ? "#7451e6" : "#201d2a"

    id: entry

    property var child: QsMenuOpener {
      menu: entry.modelData
    }

    required property QsMenuEntry modelData

    color: (modelData?.isSeparator) ? bgColorLighter : rectColor
    height: (modelData?.isSeparator) ? 2 : 28
    anchors.horizontalCenter: parent.horizontalCenter
    width: (modelData?.isSeparator) ? 300 : 316
    radius: 10

    HoverHandler {
      id:mouse
    }

    TapHandler {
      onTapped: {

        if (entry.modelData.hasChildren) {
          view.trayMenu = entry.child;
          view.positionViewAtBeginning();
        } else {
          entry.modelData.triggered();
        }
      }
    }

    RowLayout {
      anchors.fill: parent 
      anchors.leftMargin: (entry.modelData?.buttonType == QsMenuButtonType.None) ? 10 : 2
      anchors.rightMargin: 10

      Item {
        Layout.fillHeight: true
        implicitWidth: this.height
        visible: entry.modelData?.buttonType == QsMenuButtonType.CheckBox

        Text {
          anchors.centerIn: parent
          color: "#efebff"
          text: (entry.modelData?.checkState != Qt.Checked) ? "" : ""
        }
      }

      Item {

        Text {
          id: text

          anchors.fill: parent
          color: "#efebff"
          text: entry.modelData?.text ?? ""
	  verticalAlignment: Text.AlignVCenter
	  font {
	    pointSize: 10
	    bold: true
	  }
        }
      }
    }
  }
}

import QtQuick
import qs.common
import Quickshell
import QtQuick.Layouts
pragma ComponentBehavior: Bound

ListView {
  id: view
  spacing: 10
  width: contentWidth
  anchors.fill: parent 
  height: contentHeight
  required property QsMenuOpener rootMenu
  required property QsMenuOpener trayMenu
 
  model: ScriptModel {
    values: [...trayMenu?.children.values]
  } 

  delegate: Rectangle { 
    id: entry

    radius: 0
    width: 320
    required property QsMenuEntry modelData
    height: (modelData?.isSeparator) ? 2 : 30
    color: (modelData?.isSeparator) ? bgColorLighter : rectColor
    property var rectColor: mouse.hovered ? Theme.base08: Theme.base00
    property var child: QsMenuOpener {
      menu: entry.modelData
    }

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
	    bold: true
	    pointSize: 11
	    family: "Liga SFMono Nerd Font"
	  }
        }
      }
    }
  }
}

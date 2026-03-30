import QtQuick
import qs.common
import Quickshell
import QtQuick.Layouts
pragma ComponentBehavior: Bound

ListView {
  id: view
  spacing: 10
  width: contentWidth
  height: contentHeight
  anchors.fill: parent

  required property QsMenuOpener rootMenu
  required property QsMenuOpener trayMenu

  model: ScriptModel {
    values: [...trayMenu?.children.values]
  }

  delegate: Rectangle {
    id: entry

    required property QsMenuEntry modelData

    radius: 0
    width: 320
    height: modelData?.isSeparator ? 2 : 30
    color: modelData?.isSeparator ? Theme.base02 : (mouse.hovered ? Theme.base08 : Theme.base00)

    property QsMenuOpener child: QsMenuOpener { menu: entry.modelData }

    HoverHandler { id: mouse }

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
      anchors.leftMargin: modelData?.buttonType == QsMenuButtonType.None ? 10 : 2
      anchors.rightMargin: 10

      Item {
        Layout.fillHeight: true
        implicitWidth: height
        visible: modelData?.buttonType == QsMenuButtonType.CheckBox

        Text {
          anchors.centerIn: parent
          color: Theme.base05
          text: modelData?.checkState == Qt.Checked ? "" : ""
        }
      }

      Item {
        Layout.fillWidth: true
        Layout.fillHeight: true

        Text {
          anchors.fill: parent
          color: Theme.base07
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

import QtQuick
import Quickshell
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell.Widgets
import qs.Modules.Bar

Button { 
  id: settings
  Text {
    id: buttonText
    anchors.centerIn: parent
    text: "power_settings_new"
    color: Colors.txt
    font { 
      family: "Material Symbols Rounded"
      pointSize: 11
    }
  }

  background: Rectangle {
    implicitWidth: 20
    implicitHeight: 20
    radius: 20
    color: settings.pressed ? Colors.bg7 : Colors.bg1
  }
}

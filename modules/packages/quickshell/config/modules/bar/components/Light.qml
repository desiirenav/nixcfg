import QtQuick
import qs.common
import Quickshell
import Quickshell.Io
import QtQuick.Layouts

Widget { 
  implicitWidth: 70
  color: Theme.base05

  property int maxBrightness: 1
  property int currentBrightness: 0

  readonly property int brightnessPercent: maxBrightness > 0
    ? Math.round((currentBrightness / maxBrightness) * 100)
    : 0

  readonly property string icon: {
    if (brightnessPercent <= 33) return "brightness_3";
    if (brightnessPercent <= 66) return "brightness_5";
    return "brightness_7";
  }

  Process {
    running: true
    command: [ "brightnessctl", "m" ]
    stdout: SplitParser {
      onRead: data => maxBrightness = parseInt(data)
    }
  }

  Process {
    id: brightnessProc
    command: [ "brightnessctl", "g" ]
    stdout: SplitParser {
      onRead: data => currentBrightness = parseInt(data)
    }
  }

  Timer {
    interval: 500
    running: true
    repeat: true
    onTriggered: brightnessProc.running = true
  }

  RowLayout {
    anchors.centerIn: parent

    MIcon { 
      text: icon 
    }

    CText { 
      text: brightnessPercent 
    }

  }
}

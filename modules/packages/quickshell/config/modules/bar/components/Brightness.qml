import QtQuick
import qs.common
import Quickshell
import Quickshell.Io
import QtQuick.Layouts
import Quickshell.Widgets

Widget { 
  implicitWidth: 80
  color: Theme.base05
  property int maxBrightness: 62451
  property int brightnessPercent: 10

  function getBrightnessPercent(p) {
    brightnessPercent = (p / maxBrightness) * 100;
  }

  function setBrightnessIcon() { 
    if (brightnessPercent <= 33) return "brightness_3"
    if (brightnessPercent <= 66) return "brightness_5"
    return "brightness_7"
  }

  Process {
    id: brightnessPercentProc
    running: false
    command: [ "brightnessctl", "g" ]

    stdout: SplitParser {
      onRead: data => getBrightnessPercent(data);
    }
  }

  Timer {
    interval: 150
    running: true
    repeat: true
    onTriggered: brightnessPercentProc.running = true
  }

  Process {
    running: true
    command: [ "brightnessctl", "m" ]
    stdout: SplitParser {
      onRead: data => maxBrightness = data;
    }
  }

  RowLayout {
    anchors.centerIn: parent
    MaterialIcon {
      text: setBrightnessIcon()
    }
    CustomText { 
      text: brightnessPercent
    }
  }
}

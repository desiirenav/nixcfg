import QtQuick
import Quickshell
import qs.reusables
import Quickshell.Io
import QtQuick.Layouts
import Quickshell.Widgets

Widget { 
  color: Theme.base05
  implicitWidth: 69
  property int maxBrightness: 62451
  property int brightnessPercent: 10

  function getBrightnessPercent(p) {
    brightnessPercent = (p / maxBrightness) * 100;
  }

  function setbrightnessIcon() { 
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
    Material {
      text: setbrightnessIcon ()
    }
    CustomText { 
      text: brightnessPercent
    }
  }
}

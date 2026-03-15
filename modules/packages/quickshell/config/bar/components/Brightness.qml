import QtQuick
import Quickshell.Io

Text { 
  id: brightness
  property int maxBrightness: 62451
  property int brightnessPercent: 10

  function getBrightnessPercent(p) {
    brightnessPercent = (p / maxBrightness) * 100;
  }

  function setbrightnessIcon() { 
    if (brightnessPercent = 100)
    return "brightness_7";
    if (brightnessPercent >= 50)
    return "brightness_6"
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

  color: "#efebff"
  text: brightnessPercent + setbrightnessIcon()
  font {
    bold: true
    pointSize: 11
    family: {
      if (text = setbrightnessIcon ) 
         return "Material Symbols Rounded" 
      else return "Liga SFMono Nerd Font"
    }
  }
}

import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Widgets

Item {
  id: root
  PwObjectTracker {
    objects: [ Pipewire.defaultAudioSink ]
  }


  property var sink: Pipewire.defaultAudioSink

  function getVolumeIcon() {
    if (!sink)
      return "volume_mute";
    if (sink.audio.muted)
      return "volume_mute";
    const vol = sink.audio.volume;
    if (vol <= 0.25)
      return "volume_mute";
    if (vol < 0.75)
      return "volume_down";
    if (vol < 1.00)
      return "volume_up";
    
    return "volume_up"
  }


  implicitWidth: 45
  implicitHeight: 25

  Rectangle {
    implicitWidth: parent.implicitWidth
    implicitHeight: parent.implicitHeight
    Layout.fillWidth: true
    radius: 20
    color: Colors.bg2
    Rectangle { 
      color: Colors.bg7
      implicitWidth: parent.width * (Pipewire.defaultAudioSink.audio.volume)
      implicitHeight: parent.height
      radius: parent.radius
    } 
    Row {
      anchors.centerIn: parent
      Text {
        id: sound
        opacity: 1
        color: Colors.txt
        font {
	  pointSize: 11
          bold: true
        }
        text: Math.round( Pipewire.defaultAudioSink.audio.volume * 100)
      }
      Icons { 
	text: root.getVolumeIcon()
      }
    }
  }
}

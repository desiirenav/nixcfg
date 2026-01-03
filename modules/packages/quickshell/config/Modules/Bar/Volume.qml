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
	  weight: 600
        }
        text: Math.round( Pipewire.defaultAudioSink.audio.volume * 100)
      }

    }
  }
}

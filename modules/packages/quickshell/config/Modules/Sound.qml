import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Widgets

RowLayout {
  id: root
  PwObjectTracker {
    objects: [ Pipewire.defaultAudioSink ]
  }


  anchors.right: parent.right
  anchors.verticalCenter: parent.verticalCenter 
  anchors.rightMargin: 95

  Rectangle {
    implicitWidth: 60
    implicitHeight: 25
    Layout.fillWidth: true
    radius: 10
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
          pointSize: 12
	  weight: 600
        }
        text: Math.round( Pipewire.defaultAudioSink.audio.volume * 100) + " %"
      }

    }
  }
}

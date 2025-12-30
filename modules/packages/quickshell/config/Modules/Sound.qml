import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Widgets

RowLayout {

  PwObjectTracker {
    objects: [ Pipewire.defaultAudioSink ]
  }

  anchors.right: parent.right
  anchors.verticalCenter: parent.verticalCenter 
  anchors.rightMargin: 95

  Rectangle {
    implicitWidth: 75
    implicitHeight: 30
    Layout.fillWidth: true
    radius: 13
    color: Colors.brd
    Rectangle { 
      color: white
      implicitWidth: parent.width * (Pipewire.defaultAudioSink.audio.volume)
      implicitHeight: parent.height
      radius: parent.radius
    }
    Text {
      id: sound
      anchors.centerIn: parent
      opacity: 1
      font {
        pointSize: 12
	weight: 600
      }
      text: Math.round( Pipewire.defaultAudioSink.audio.volume * 100) + " %"
    }
  }

}

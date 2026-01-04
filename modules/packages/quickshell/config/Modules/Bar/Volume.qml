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
  implicitWidth: 50
  implicitHeight: 30
  MouseArea {
    anchors.fill: parent
    onClicked: mouse => {
      switch (mouse.button) {
        case Qt.LeftButton:
          popup.visible = !popup.visible
          break;
        case Qt.MiddleButton:
          Audio.sink.audio.muted = !Audio.muted
          break;
        case Qt.RightButton:
          Audio.source.audio.muted = !Audio.source.audio.muted
          break;
      }
    }
  }

  Rectangle {
    implicitWidth: parent.implicitWidth
    implicitHeight: parent.implicitHeight
    Layout.fillWidth: true
    radius: 20
    color: Colors.bg2
    Rectangle { 
      color: Colors.txt
      implicitWidth: parent.width * (Pipewire.defaultAudioSink.audio.volume)
      implicitHeight: parent.height
      radius: parent.radius
    } 
    Row {
      anchors.centerIn: parent
      Text {
        id: sound
        opacity: 1
        color: Colors.bg0
        font {
          pointSize: 11
	  bold: true
        }
        text: Math.round( Pipewire.defaultAudioSink.audio.volume * 100)
      }
    }
  }
}

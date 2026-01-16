import QtQuick
import Quickshell
import QtQuick.Layouts
import Quickshell.Widgets
import Quickshell.Services.Pipewire

Item { 
  id: root
  PwObjectTracker {
    objects: [ Pipewire.defaultAudioSink ]
  }
}

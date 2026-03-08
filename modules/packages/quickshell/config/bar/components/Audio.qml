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

  property var sink: Pipewire.defaultAudioSink

  Text { 
    anchors.centerIn: parent
    color: "#a286fd"
    text: { 
      if (!sink)
        return "volume_mute";
      if (sink.audio.muted)
        return "volume_off";
      const vol = sink.audio.volume;
      if (vol <= 0.25)
        return "volume_mute";
      if (vol < 0.75)
        return "volume_down";
      if (vol < 1.00)
        return "volume_up";
    
      return "volume_up"
    }
    font { 
      family: "Material Symbols Rounded"
      pointSize: 14
    }
  }
}

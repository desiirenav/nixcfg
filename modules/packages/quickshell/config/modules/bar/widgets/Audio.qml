import QtQuick
import Quickshell
import qs.reusables
import QtQuick.Layouts
import Quickshell.Widgets
import Quickshell.Services.Pipewire

Widget {
  implicitWidth: 69
  PwObjectTracker { objects: [ Pipewire.defaultAudioSink ] }
  color: Theme.base0E
  RowLayout {
    anchors.centerIn: parent
    Material {
      text: { 
        if (!Pipewire.defaultAudioSink)
          return "volume_mute";
        if (Pipewire.defaultAudioSink.audio.muted)
          return "volume_off";
        const vol = Pipewire.defaultAudioSink.audio.volume;
        if (vol <= 0.25)
          return "volume_mute";
        if (vol < 0.75)
          return "volume_down";
        if (vol < 1.00)
          return "volume_up";
         return "volume_up"
      }
    }
    CustomText {
      text: Math.round( Pipewire.defaultAudioSink.audio.volume * 100) 
    }
  }
}

import QtQuick
import qs.common
import Quickshell
import QtQuick.Layouts
import Quickshell.Widgets
import Quickshell.Services.Pipewire

Widget {
  implicitWidth: 70
  color: Theme.base0E

  PwObjectTracker { objects: [ Pipewire.defaultAudioSink ] }

  readonly property var sink: Pipewire.defaultAudioSink
  readonly property bool muted: !sink || sink.audio.muted
  readonly property double volume: sink?.audio.volume ?? 0

  readonly property string icon: {
    if (muted || volume <= 0.25) return "volume_mute";
    if (volume < 0.75) return "volume_down";
    return "volume_up";
  }

  RowLayout {
    anchors.centerIn: parent
    MIcon { text: icon }
    CText { text: sink ? Math.round(volume * 100) : "0" }
  }
}

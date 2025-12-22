import QtQuick
import Quickshell
import qs.Bar
import qs.Widgets

ShellRoot {
  Loader {
    active: true
    sourceComponent: Bar{}
  }
}

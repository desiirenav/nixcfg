import qs.Bar
import qs.Widgets
import QtQuick
import Quickshell

shellRoot {
  id: root
  Loader {
    active: true
    sourceComponent: Bar{}
  }
}

import QtQuick
import qs.Modules.Bar
import Quickshell
import QtQuick.Layouts

ShellRoot {
  Variants { 
    id: barVariant
    model: Quickshell.screens
    delegate: Bar {
      screen: modelData
    }
  }
}

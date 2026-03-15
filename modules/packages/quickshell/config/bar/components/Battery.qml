import QtQuick
import QtQuick.Layouts
import Quickshell.Services.UPower

Text { 
  color: "#efebff"
  text: Math.round(UPower.displayDevice.percentage * 100) + " %"
  font {
    bold: true
    pointSize: 11
    family: "Liga SFMono Nerd Font"
  }
}

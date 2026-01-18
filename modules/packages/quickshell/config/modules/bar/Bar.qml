import QtQuick
import qs.common
import Quickshell
import QtQuick.Layouts
import Quickshell.Wayland
import qs.modules.bar.widgets

Variants {
  model: Quickshell.screens
  delegate: PanelWindow { 
    color: "transparent"
    implicitHeight: 50
    implicitWidth: 500

    anchors {
      top: true
      left: false
      right: false
    } 

    Rectangle { 
      radius: 50
      color: Theme.base00

      anchors {
	fill: parent
        topMargin: 10
      } 

      RowLayout {
	spacing: 10
	anchors {	      
	  left: parent.left
	  verticalCenter: parent.verticalCenter
	  leftMargin: 20
        } 

	Nix {}
	Time {}
     }


      RowLayout {
 	anchors {	      
	  left: parent.left
	  verticalCenter: parent.verticalCenter
	  leftMargin: 130
        } 
	Workspaces {}
      } 



      RowLayout {
	anchors { 
	  right: parent.right
	  verticalCenter: parent.verticalCenter
          rightMargin: 150
        } 

         SysTray {}
      } 



      RowLayout {
	anchors { 
	  right: parent.right
	  verticalCenter: parent.verticalCenter
          rightMargin: 100
        } 

	Audio {}
      } 


      RowLayout {
	anchors { 
	  right: parent.right
	  verticalCenter: parent.verticalCenter
          rightMargin: 10
        } 

	Battery {}
      } 

    }
  }
}

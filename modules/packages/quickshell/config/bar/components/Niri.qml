import QtQuick
import Quickshell
import Quickshell.Io
import QtQuick.Layouts

Item {
  id: root

  implicitWidth: 150
  implicitHeight: 30

  property var workspaceData: []
  property int focusedWorkspaceIdx: 1

  function updateFromWorkspaces(workspaces) {
    if (!workspaces || !Array.isArray(workspaces)) return;
      root.workspaceData = workspaces;
      for (var i = 0; i < workspaces.length; i++) {
        if (workspaces[i].is_focused) {
          root.focusedWorkspaceIdx = workspaces[i].idx;
          break;
        }
     }
  }

  Timer {
    id: retryTimer
    interval: 2000
    onTriggered: {
      if (!initialFetch.running) initialFetch.running = true;
      if (!niriEvents.running) niriEvents.running = true;
    }
  }

  Process {
    id: initialFetch
    command: ["niri", "msg", "--json", "workspaces"]
    running: true
    stdout: StdioCollector {
    onStreamFinished: {
      try {
        if (text.trim() !== "") {
          var workspaces = JSON.parse(text);
          root.updateFromWorkspaces(workspaces);
          }
      } catch (e) {
          console.log("Error parsing workspaces: " + e);
        }
      }
    }
    onExited: (exitCode) => {
      if (exitCode !== 0) {
        if (!retryTimer.running) retryTimer.start();
      }
    }
  }

  Process {
    id: niriEvents
    command: ["niri", "msg", "--json", "event-stream"]
    running: true

    stdout: SplitParser {
    splitMarker: "\n"
    onRead: (data) => {
      if (!data || data.trim() === "") return;
        try {
          var event = JSON.parse(data);
          if (event.WorkspacesChanged) {
	    root.updateFromWorkspaces(event.WorkspacesChanged.workspaces);
          } else if (event.WorkspaceActivated) {
	    initialFetch.running = true;
          }
        } catch (e) {}
      }
    }
    onExited: (exitCode) => {
      running = false;
      if (!retryTimer.running) retryTimer.start();
    }
  }

  Process {
    id: switchProc
  }


  Rectangle { 
    color: "transparent"
    anchors.fill: parent
    radius: 30

    RowLayout { 
      anchors.fill: parent
      Repeater { 
	model: [1, 2, 3]
	delegate: Rectangle { 
	  implicitWidth: 50
	  implicitHeight: 30
	  radius: 30
	  color: modelData === root.focusedWorkspaceIdx ? "#7451e6" : "#201d2a"
	  Text { 
	    anchors.centerIn: parent
            color: "#efebff"
	    text: modelData
            
	    font { 
	      bold: true
              pointSize: 10
	    }

	    MouseArea { 
	      anchors.fill: parent
	      cursorShape: Qt.PointingHandCursor
	      onClicked: { 
		switchProc.command = ["niri", "msg", "action", "focus-workspace", modelData.toString()];
		switchProc.running = true;
	      }
	    }
	  }
	}
      }
    }
  }
}

import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io

Item {
  id: root

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

}

pragma Singleton
pragma ComponentBehavior: Bound
import Quickshell
import Quickshell.Io

Singleton {
  id: root
  property var currentWorkspace
  property var layoutName
  Process {
    command: ["mmsg","-w","-l"]
    running: true
    onRunningChanged: if (!running) running = true
    stdout: SplitParser {
      onRead: line=> {
        const regEx = /(.*) layout ([STGMKVC])/;
        const data = regEx.exec(line);
        if(!data)
          return;
        const Display = data[1];
        const Layout = data[2];
        root.layoutName = Layout;
      }
    }
  }
  Process {
    command: ["mmsg", "-w", "-t"]
    running: true
    onRunningChanged: if (!running) running = true
    stdout: SplitParser {
      onRead: line => {
          const regEx = /(.*) tag (\d) (\d) (\d) (\d)/;
          const data = regEx.exec(line);
          if(!data)
            return;
          const Ntag = data[2];
          const StateTag = data[3];
          const Nclients = data[4];
          if ( StateTag == "1") {
            root.currentWorkspace = Ntag;
          }
      }
    }
  }
}



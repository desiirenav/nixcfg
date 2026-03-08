import QtQuick
pragma Singleton
import Quickshell
import QtQuick.Layouts

Rectangle {
  color: "red"
  implicitWidth: 60
  implicitHeight: 30
  property alias enabled: clock.enabled
  readonly property date date: clock.date

  function format(fmt: string): string {
    return Qt.formatDateTime(clock.date, fmt);
  }

  SystemClock {
    id: clock
    precision: SystemClock.Seconds
  }
}

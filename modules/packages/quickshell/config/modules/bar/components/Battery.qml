import QtQuick
import qs.common
import QtQuick.Layouts
import Quickshell.Services.UPower

Widget {
  color: Theme.base0F
  implicitWidth: 70

  property var battery: UPower.displayDevice

  property var batteryIcons: ({
    charging: {
      full: "battery_charging_Full",
      high: "battery_charging_90",
      medium: "battery_charging_80",
      mediumLow: "battery_charging_60",
      low: "battery_charging_50",
      veryLow: "battery_charging_30",
      critical: "battery_charging_20"
    },
    discharging: {
      full: "battery_full",
      high: "battery_6_bar",
      medium: "battery_5_bar",
      mediumLow: "battery_4_bar",
      low: "battery_3_bar",
      veryLow: "battery_2_bar",
      critical: "battery_1_bar"
    }
  })

  function getBatteryIcon() {
    const percentage = battery?.percentage ?? 0
    const isCharging = battery?.state == UPowerDeviceState.Charging
    const iconSet = isCharging ? batteryIcons.charging : batteryIcons.discharging

    if (percentage >= 0.9) return iconSet.full
    if (percentage >= 0.8) return iconSet.high
    if (percentage >= 0.6) return iconSet.medium
    if (percentage >= 0.5) return iconSet.mediumLow
    if (percentage >= 0.3) return iconSet.low
    if (percentage >= 0.2) return iconSet.veryLow
    return iconSet.critical
  }

  RowLayout { 
    anchors.centerIn: parent
    MaterialIcon {
      text: getBatteryIcon()
    }
    CustomText {
      text: Math.round(battery.percentage * 100)
    }
  }
}

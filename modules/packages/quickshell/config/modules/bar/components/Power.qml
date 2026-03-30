import QtQuick
import qs.common
import QtQuick.Layouts
import Quickshell.Services.UPower

Widget {
  implicitWidth: 70
  color: Theme.base0F

  readonly property var battery: UPower.displayDevice
  readonly property double percentage: battery?.percentage ?? 0
  readonly property bool charging: battery?.state == UPowerDeviceState.Charging

  readonly property string icon: {
    const p = percentage;
    const c = charging;
    if (p >= 0.9) return c ? "battery_charging_full" : "battery_full";
    if (p >= 0.8) return c ? "battery_charging_90"   : "battery_6_bar";
    if (p >= 0.6) return c ? "battery_charging_80"   : "battery_5_bar";
    if (p >= 0.5) return c ? "battery_charging_60"   : "battery_4_bar";
    if (p >= 0.3) return c ? "battery_charging_50"   : "battery_3_bar";
    if (p >= 0.2) return c ? "battery_charging_30"   : "battery_2_bar";
    return c ? "battery_charging_20" : "battery_1_bar";
  }

  RowLayout {
    anchors.centerIn: parent

    MIcon { 
      text: icon 
    }
    CText { 
      text: Math.round(percentage * 100) 
    }
  }
}

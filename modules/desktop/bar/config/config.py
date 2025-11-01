import os
from config.modules import clock_label
from ignis import widgets
from ignis.utils import Utils

def bar(monitor: int) -> widgets.Window:
    clock_label = Widget.Label()

    Utils.Poll(1000, lambda x: update_label(clock_label))

    return Widget.Window(
        namespace=f"some-window-{monitor}",
        monitor=monitor,
        child=Widget.Box(
            vertical=True,
            spacing=10,
            child=[clock_label],
        ),
    )


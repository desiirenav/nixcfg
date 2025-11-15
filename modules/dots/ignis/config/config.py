import os
import datetime
from ignis import widgets
from ignis import utils
from modules.time import clock


def left() -> widgets.Box:
    return widgets.Box(
        child=[], spacing=10
    )

def center() -> widgets.Box:
    return widgets.Box(
        child=[
            clock()
        ],
        spacing=10,
    )

def right() -> widgets.Box:
    return widgets.Box(
        child=[
        ],
        spacing=10,
    )

def bar(monitor: int) -> widgets.Window:

    return widgets.Window(
        namespace=f"some-window-{monitor}",
        monitor=monitor,
        anchor=["left", "top", "right"],
        child=widgets.CenterBox(
            start_widget=left(),
            center_widget=center(),
            end_widget=right(),
        ),
    )

for i in range(utils.get_n_monitors()):
    bar(i)

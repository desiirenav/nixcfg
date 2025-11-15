import datetime
from ignis import widgets
from ignis import utils

def clock() -> widgets.Label:
    return widgets.Label(
        css_classes=["clock"],
        label=utils.Poll(
            1_000, lambda self: datetime.datetime.now().strftime("%H:%M")
        ).bind("output"),
    )

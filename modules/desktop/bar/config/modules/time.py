import datetime
from ignis.widgets import Widget
from ignis.utils import Utils

def update_label(clock_label: Widget.Label) -> None:
    text = datetime.datetime.now().strftime("%H:%M:%S")
    clock_label.set_label(text)

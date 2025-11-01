from ignis import widgets

widgets.Window(
    namespace="some-window",
    child=widgets.Box(
        vertical=True,  # this box is vertical
        spacing=10,  # add some spacing between widgets
        child=[  # define list of child widgets here
            widgets.Label(label="This is the first child of the first box"),
            widgets.Box(
                spacing=26,
                child=[
                    widgets.Label(label="This is the first child of the second box"),
                    widgets.Label(label="Second child (by default this box child will be added horizontally)"),
                ]
            ),
        ],
    ),
)

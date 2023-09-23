# Playrectl widget for qtile by Jäbä

import subprocess
from libqtile.widget import base


class PlayerctlWidget(base.InLoopPollText):
    """
    Simple widget to display the artist and song got from playerctl.
    """

    defaults = [
        ("update_interval", 5.0, "Update interval for the widget"),
        ("format", "{artist} - {title}", "Display format"),
    ]

    def __init__(self, **config):
        super().__init__("", **config)
        self.add_defaults(PlayerctlWidget.defaults)

    def poll(self):
        status = subprocess.run(
            ["playerctl", "status"], capture_output=True, text=True
        ).stdout.strip()

        if status != "Playing":
            return ""
        else:
            variables = dict()
            variables["title"] = subprocess.run(
                ["playerctl", "metadata", "title"], capture_output=True, text=True
            ).stdout.strip()
            variables["artist"] = subprocess.run(
                ["playerctl", "metadata", "artist"], capture_output=True, text=True
            ).stdout.strip()
            return self.format.format(**variables)

# Jäbän Qtile config

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
# from libqtile import hook
# from libqtile import qtile
# from libqtile.backend.wayland import InputConfig
import playerctl as playerctl
import colors
# import subprocess

# if qtile.core.name == "x11":
    # do nothing
# if qtile.core.name == "wayland":
    # kb_layout="fi"

# wl_input_rules = {
#     "type:keyboard": InputConfig(kb_layout="se"),
# }
# lazy.core.set_keymap(layout="fi")


# ========== Rules ==========

mod = "mod1"  # mod = "mod4"
dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = False
wl_input_rules = None
wmname = "LG3D"  # Java WM name for some java bullshit


# ========== Keybindigs ==========

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod, "control"], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod, "control"], "f", lazy.window.toggle_floating(), desc="Toggle floating status"),

    # Switch focus of monitors
    Key([mod], "o", lazy.next_screen(), desc='Move focus to next monitor'),
    Key([mod], "a", lazy.prev_screen(), desc='Move focus to prev monitor'),

    # Random stuff
    Key([mod], "Return", lazy.spawn("wezterm"), desc="Launch terminal"),
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "shift"], "o", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown()),
    Key([], "Print", lazy.spawn("maim --select | xclip -selection clipboard -t image/png", shell=True), desc="Take screenshot"),
    Key([mod], "u", lazy.spawn("rofi -show combi -modes combi -combi-modes 'drun,run'"), desc="Spawn a command using rofi"),
    Key([mod], "e", lazy.spawn("wezterm start nnn"), desc="Start file explorer"),
    Key([mod], "p", lazy.spawn("i3lock"), desc="Lock the screen"),
    Key([mod], "m", lazy.hide_show_bar("bottom"), desc="Toggle bar"),
    Key([mod], "b", lazy.spawn("neovide -- -c 'Neorg workspace home'"), desc="Start notes"),

    # Multimedia keys
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer sset Master 5%+")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer sset Master 5%-")),
    Key([], "XF86AudioMute", lazy.spawn("amixer sset Master 1+ toggle")),
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),

    # Brightness control
    # Requires xbacklightcontrol or acpilight package and brightnessctl
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-")),
]


# ========== Groups ==========

groups = [
    # layout="monadtall"
    Group("1", spawn="firefox", label="Web", layout="monadtall"),
    Group("2", label="Notes", layout="tile"),
    Group("3", spawn=["discord", "wezterm start --always-new-process profanity -a Koiskis"], label="Chat", layout="max"),
    Group("4", spawn="thunderbird", label="Mail", layout="monadtall"),
    Group("5", spawn=["lutris", "/home/nuuttih/bin/freetube"], label="Games", layout="max"),
    Group("z", label="Dev"),
    Group("Adiaeresis", label="Dev2"),
    Group("y", label="Dev3"),
    Group("i", label="Dev4"),
]

# Keybindings for groups
for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key([mod], i.name, lazy.group[i.name].toscreen(), desc="Switch to group {}".format(i.name)),
            # mod1 + shift + letter of group = switch to & move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True), desc="Switch to & move focused window to group {}".format(i.name)),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
                desc="move focused window to group {}".format(i.name)),
        ]
    )

# ========== Colorscheme ==========
colors = colors.oma

# ========== Layouts ==========

# active_color = "#4BE100"
# normal_color = "#76D2FF"
active_color = colors[2]
normal_color = colors[3]
width = 2
master_size = 0.618
margin = 3
columns = 2

layouts = [
    layout.Tile(
        border_focus=active_color,
        border_normal=normal_color,
        border_width=width,
        ratio=master_size,
        margin=margin,
        border_on_single=False,
        margin_on_single=False,
    ),
    # layout.VerticalTile(
    #     border_focus=active_color,
    #     border_normal=normal_color,
    #     border_width=width,
    #     margin=margin,
    #     single_border_width=None,
    #     single_margin=None,
    # ),
    layout.MonadTall(
        border_focus=active_color,
        border_normal=normal_color,
        border_width=width,
        ratio=master_size,
        margin=margin,
        single_border_width=0,
        single_margin=0,
    ),
    # layout.MonadWide(
    #     border_focus=active_color,
    #     border_normal=normal_color,
    #     border_width=width,
    #     ratio=master_size,
    #     margin=margin,
    #     single_border_width=0,
    #     single_margin=0,
    # ),
    layout.Max(),
    layout.Columns(
        border_focus=active_color,
        border_width=width,
        margin=margin,
        num_columns=columns,
        border_on_single=False,
        margin_on_single=False,
    ),
    # layout.TreeTab(),
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.RatioTile(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

# Floating layout
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
# Drag floating layouts.
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

# ========== Screens ==========

# Default values for widgets
widget_defaults = dict(
    font="sans",
    fontsize=16,
    padding=3,
    background = colors[0],
    foreground = colors[1]
)
extension_defaults = widget_defaults.copy()

# Init widgets
def init_widgets_list():
    widgets_list = [
        # Left side
        widget.GroupBox(
            hide_unused=True,
            active = colors[1],
            this_current_screen_border = colors[4],
            this_screen_border = colors [5],
            other_current_screen_border = colors[4],
            other_screen_border = colors[5],
        ),
        # Prompt not needed, I use rofi
        # widget.Prompt(),

        widget.Spacer(),

        # Middle
        # widget.Notify(),
        widget.Clock(
            format="%H:%M:%S",
            # foreground = colors[3]
        ),
        widget.Spacer(),

        # Right side
        playerctl.PlayerctlWidget(),
        widget.WidgetBox(
            widgets = [
                widget.CurrentLayout(
                    # foreground = colors[4],
                ),
                widget.Sep(),
                widget.Volume(
                    fmt = "vol: {}",
                    # foreground = colors[5],
                ),
                widget.Sep(),
                widget.Backlight(
                    backlight_name = "intel_backlight", fmt="Br: {}",
                    # foreground = colors[6],
                ),
                widget.Sep(),
            ]
        ),
        widget.CPU(
            format = "{load_percent}%",
            update_interval = 15.0,
            # foreground = colors[7],
        ),
        widget.Sep(),
        widget.Memory(
            measure_mem = "G",
            format = "{MemUsed: .2f}{mm}/{MemTotal: .1f}{mm}",
            # foreground = colors[8],
        ),
        widget.Sep(),
        widget.Battery(
            discharge_char = "",
            format = "B{char}{percent:2.0%}",
            charge_char = "^",
            # foreground = colors[3],
        ),
        # ]),
        widget.Sep(),
        widget.Clock(
            format = "%a %d.%m.%Y",
            # foreground = colors[4],
        ),
        widget.Systray(),
        # widget.Sep(),
        # widget.QuickExit(),
    ]
    return widgets_list

# Monitor 1 will display ALL widgets in widgets_list. It is important that this
# is the only monitor that displays all widgets because the systray widget will
# crash if you try to run multiple instances of it.
def init_widgets_screen1():
    widgets_screen1 = init_widgets_list()
    return widgets_screen1 

def init_widgets_screen2():
    widgets_screen2 = init_widgets_list()
    # delete systray
    del widgets_screen2[13:14]
    # delete playerctl widget
    # del widgets_screen2[4:5]
    # Delete performance indicators
    del widgets_screen2[6:12]
    return widgets_screen2


def init_screens():
    return [
            Screen(
                wallpaper="~/Pictures/wallpapers/endless2.jpg",
                wallpaper_mode="fill",
                bottom=bar.Bar(widgets=init_widgets_screen1(), size=23)
                ),
            Screen(
                wallpaper="~/Pictures/wallpapers/endless6.jpg",
                wallpaper_mode="stretch",
                bottom=bar.Bar(widgets=init_widgets_screen2(), size=23)
                )
            ]

if __name__ in ["config", "__main__"]:
    screens = init_screens()
    widgets_list = init_widgets_list()
    widgets_screen1 = init_widgets_screen1()
    widgets_screen2 = init_widgets_screen2()

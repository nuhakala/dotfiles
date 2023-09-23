# Jäbän Qtile config

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
import playerctl as playerctl
import os


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
    # Alternative movements
    Key([mod], "o", lazy.layout.right(), desc="Move focus up"),
    Key([mod], "a", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key(
        [mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"
    ),
    Key(
        [mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key(
        [mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"
    ),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Random stuff
    Key([mod], "Return", lazy.spawn("wezterm"), desc="Launch terminal"),
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "shift"], "o", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown()),
    Key(
        [mod],
        "u",
        lazy.spawn("rofi -show combi -modes combi -combi-modes 'drun,run'"),
        desc="Spawn a command using rofi",
    ),
    Key(
        [mod],
        "e",
        lazy.spawn("wezterm start nnn"),
        desc="Start file explorer",
    ),
    Key(
        [mod],
        "l",
        lazy.spawn("i3lock"),
        desc="Lock the screen",
    ),
    Key(
        [],
        "Print",
        lazy.spawn(
            "maim --select | xclip -selection clipboard -t image/png", shell=True
        ),
        desc="Take screenshot",
    ),
    Key([mod], "m", lazy.hide_show_bar("bottom"), desc="Toggle bar"),

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
    Group("2", label="Dev", layout="tile"),
    Group("3", spawn=["discord", "gajim"], label="Chat", layout="columns"),
    Group("4", spawn="lutris", label="Games", layout="max"),
    Group("5", spawn="thunderbird", label="Mail", layout="monadtall"),
    Group("z", label="6"),
    Group("Adiaeresis", label="7"),
    Group("y", label="8"),
    Group("i", label="9"),
]

# Keybindings for groups
for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )


# ========== Layouts ==========

active_color = "#4BE100" # "#76D2FF"
normal_color = "#000000"
width = 1
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

widget_defaults = dict(
    font="sans",
    fontsize=16,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        wallpaper="~/Pictures/wallpapers/mr_torgue_1.jpg",
        wallpaper_mode="stretch",
        bottom=bar.Bar(
            [
                # Left side
                widget.GroupBox(hide_unused=True),
                # Prompt not needed, I use rofi
                # widget.Prompt(),
                widget.Spacer(),

                # Middle
                # widget.Notify(),
                widget.Clock(format="%a %H:%M"),
                widget.Spacer(),

                # Right side
                playerctl.PlayerctlWidget(),
                widget.WidgetBox(
                    widgets=[
                        widget.CurrentLayout(),
                        widget.Sep(),
                        widget.Volume(fmt="vol: {}"),
                        widget.Sep(),
                        widget.Backlight(backlight_name="intel_backlight", fmt="Br: {}"),
                        widget.Sep(),
                    ]
                ),
                widget.CPU(format="{load_percent}%"),
                widget.Sep(),
                widget.Memory(measure_mem="G", format='{MemUsed: .2f}{mm}/{MemTotal: .1f}{mm}'),
                widget.Sep(),
                widget.Battery(
                    discharge_char="", format="B{char}{percent:2.0%}", charge_char="^"
                ),
                # ]),
                widget.Sep(),
                widget.Clock(format="%d.%m.%Y"),
                # widget.Sep(),
                # widget.QuickExit(),
            ],
            24,
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
    ),
]

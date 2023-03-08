from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
import os,subprocess

mod = "mod4"
alt = "mod1"
terminal = "alacritty"


keys = [
    Key([mod], "h", lazy.layout.shrink()),
    Key([mod], "l", lazy.layout.grow()),
    Key([mod], "j", lazy.layout.next()),
    Key([mod], "k", lazy.layout.previous()),

    Key([mod], "Left", lazy.layout.shuffle_left()),
    Key([mod], "Right", lazy.layout.shuffle_right()),
    Key([mod], "Down", lazy.layout.shuffle_down()),
    Key([mod], "Up", lazy.layout.shuffle_up()),

    Key([mod], "h", lazy.layout.grow_left()),
    Key([mod], "l", lazy.layout.grow_right()),
    Key([mod, "shift"], "Up", lazy.layout.grow_up()),
    Key([mod, "shift"], "Down", lazy.layout.grow_down()),

    Key( [mod, "shift"], "Return", lazy.layout.toggle_split(),),
    Key([mod], "Return", lazy.spawn(terminal)),
    Key([mod], "space", lazy.spawn("$HOME/.config/rofi/launchers/type-1/launcher.sh")),

    # bind = $mainMod, space, exec, $HOME/.config/rofi/launchers/type-1/launcher.sh
    Key([mod], "q", lazy.window.kill()),
    Key([mod], "semicolon", lazy.spawncmd()),
    Key([mod], "w", lazy.hide_show_bar("left")),
    Key([mod, "control"], "r", lazy.reload_config()),
    Key([mod, "control"], "q", lazy.shutdown()),

]

groups = [Group(i) for i in "asdop"]

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
            # Key( [mod, "control"], i.name, lazy.window.togroup(i.name, switch_group=True),
            #     desc="Switch to & move focused window to group {}".format(i.name),),
            Key([mod, "control"], i.name, lazy.window.togroup(i.name),
                desc="move focused window to group {}".format(i.name)),
        ]
    )

layouts = [ layout.Columns(border_width=0) ]

widget_defaults = dict(
    font="Iosevka SemiBold",
    fontsize=14,
    padding=4,
)
extension_defaults = widget_defaults.copy()

# screens = [ Screen() ]

screens = [
    Screen()
        # left=bar.Bar(
        #     [
        #         # widget.Battery(format='{char} {percent:2.0%}'),
        #         # widget.Prompt(),
        #         # widget.WindowName(max_chars=20),
        #         # widget.Clock(format="%Y-%m-%d %a %I:%M %p"),
        #     ], 0,background="#00151720")),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
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



auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

auto_minimize = True
wl_input_rules = None
wmname = "LG3D"

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])

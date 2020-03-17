# -*- coding: utf-8 -*-
import re
import shlex
from xkeysnail.transform import *

def cycle(app):
    _cycle = "bash /home/nlfiasel/.doom.d/dot/wmctrl/cycle "
    return shlex.split(_cycle+app)
    
define_timeout(0.3)

define_modmap({
    Key.ESC: Key.GRAVE,
    Key.CAPSLOCK: Key.LEFT_CTRL,
    Key.RIGHT_ALT: Key.LEFT_SHIFT,
})

define_multipurpose_modmap({
    Key.TAB: [Key.TAB, Key.RIGHT_CTRL],
    Key.LEFT_ALT: [Key.ESC, Key.LEFT_ALT],
    Key.LEFT_CTRL: [Key.ESC, Key.LEFT_CTRL],
    Key.SPACE: [Key.SPACE, Key.LEFT_CTRL],
    Key.GRAVE: [Key.GRAVE, Key.LEFT_META],
})

define_conditional_multipurpose_modmap(re.compile(r'Emacs'), {
    Key.TAB: [Key.TAB, Key.RIGHT_CTRL],
    Key.LEFT_ALT: [Key.ESC, Key.LEFT_ALT],
    Key.LEFT_CTRL: [Key.ESC, Key.LEFT_CTRL],
    Key.SPACE: [Key.SPACE, Key.LEFT_CTRL],
    Key.LEFT_SHIFT: [Key.F13, Key.LEFT_SHIFT],
    Key.GRAVE: [Key.GRAVE, Key.LEFT_META],
})

define_keymap(None, {
    K("RC-KEY_1"): K("F1"),
    K("RC-KEY_2"): K("F2"),
    K("RC-KEY_3"): K("F3"),
    K("RC-KEY_4"): K("F4"),
    K("RC-KEY_5"): K("F5"),
    K("RC-KEY_6"): K("F6"),
    K("RC-KEY_7"): K("F7"),
    K("RC-KEY_8"): K("F8"),
    K("RC-KEY_9"): K("F9"),
    K("RC-KEY_0"): K("F10"),
    K("RC-MINUS"): K("F11"),
    K("RC-EQUAL"): K("F12"),

    K("RC-P"): K("MUTE"),
    K("RC-LEFT_BRACE"): K("VOLUMEDOWN"),
    K("RC-RIGHT_BRACE"): K("VOLUMEUP"),
    K("RC-BACKSLASH"): K("PRINT"),
    K("RC-APOSTROPHE"): K("CAPSLOCK"),
    K("RC-U"): K("PREVIOUSSONG"),
    K("RC-I"): K("PLAYPAUSE"),
    K("RC-O"): K("NEXTSONG"),

    K("RC-H"): K("LEFT"),
    K("RC-J"): K("DOWN"),
    K("RC-K"): K("UP"),
    K("RC-L"): K("RIGHT"),

    K("RC-LC-H"): K("LC-LEFT"),
    K("RC-LC-J"): K("LC-DOWN"),
    K("RC-LC-K"): K("LC-UP"),
    K("RC-LC-L"): K("LC-RIGHT"),

    K("RC-LC-LM-KEY_1"): K("LC-LM-F1"),
    K("RC-LC-LM-KEY_2"): K("LC-LM-F2"),
    K("RC-LC-LM-KEY_3"): K("LC-LM-F3"),

    K("RC-D"): launch(cycle("dolphin")),
    K("RC-E"): launch(cycle("emacs")),
    K("RC-R"): launch(cycle("konsole")),
    K("RC-S"): launch(cycle("mpv")),
    K("RC-T"): launch(cycle("telegram")),
    K("RC-W"): launch(cycle("chromium")),
})

define_keymap(lambda wm_class: wm_class not in ("Emacs"), {
    K("LC-H"): K("LEFT"),
    K("LC-J"): K("DOWN"),
    K("LC-K"): K("UP"),
    K("LC-L"): K("RIGHT"),
})

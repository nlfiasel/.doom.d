# -*- coding: utf-8 -*-
import re
from xkeysnail.transform import *

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

    K("LC-RC-H"): K("LC-LEFT"),
    K("LC-RC-J"): K("LC-DOWN"),
    K("LC-RC-K"): K("LC-UP"),
    K("LC-RC-L"): K("LC-RIGHT"),

    K("LC-RC-LM-KEY_1"): K("LC-LM-F1"),
    K("LC-RC-LM-KEY_2"): K("LC-LM-F2"),
    K("LC-RC-LM-KEY_3"): K("LC-LM-F3"),

    K("RC-D"): launch(["wmctrl", "-xa", "dolphin"]),
    K("RC-E"): launch(["wmctrl", "-xa", "emacs"]),
    K("RC-S"): launch(["wmctrl", "-xa", "mplayer"]),
    K("RC-T"): launch(["wmctrl", "-xa", "telegram"]),
    K("RC-W"): launch(["wmctrl", "-xa", "chromium"]),
})

define_keymap(lambda wm_class: wm_class not in ("Emacs"), {
    K("LC-H"): K("LEFT"),
    K("LC-J"): K("DOWN"),
    K("LC-K"): K("UP"),
    K("LC-L"): K("RIGHT"),
})

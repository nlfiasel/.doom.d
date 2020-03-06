# -*- coding: utf-8 -*-
import re
from xkeysnail.transform import *

define_modmap({
    Key.ESC: Key.GRAVE,
    Key.CAPSLOCK: Key.LEFT_CTRL,
})

define_multipurpose_modmap({
    Key.TAB: [Key.TAB, Key.RIGHT_CTRL],
    Key.LEFT_CTRL: [Key.ESC, Key.LEFT_CTRL],
    Key.ENTER: [Key.ENTER, Key.RIGHT_SHIFT],
    Key.SEMICOLON: [Key.SEMICOLON, Key.RIGHT_SHIFT],
})

define_conditional_multipurpose_modmap(re.compile(r'Emacs'), {
    Key.TAB: [Key.TAB, Key.RIGHT_CTRL],
    Key.LEFT_CTRL: [Key.ESC, Key.LEFT_CTRL],
    Key.ENTER: [Key.ENTER, Key.RIGHT_SHIFT],
    Key.LEFT_SHIFT: [Key.F13, Key.LEFT_SHIFT],
    Key.SEMICOLON: [Key.SEMICOLON, Key.RIGHT_SHIFT],
})

define_keymap(None, {
    K("RC-key_4"): K("F4"),
    K("RC-key_5"): K("F5"),
    K("RC-key_6"): K("F6"),
    K("RC-key_7"): K("F7"),
    K("RC-key_8"): K("F8"),
    K("RC-key_9"): K("F9"),
    K("RC-p"): K("mute"),
    K("RC-LEFT_BRACE"): K("volumedown"),
    K("RC-RIGHT_BRACE"): K("volumeup"),
    K("RC-BACKSLASH"): K("print"),
    K("RC-APOSTROPHE"): K("CAPSLOCK"),

    K("RC-H"): K("LEFT"),
    K("RC-J"): K("DOWN"),
    K("RC-K"): K("UP"),
    K("RC-L"): K("RIGHT"),
    K("LC-RC-H"): K("LC-LEFT"),
    K("LC-RC-J"): K("LC-DOWN"),
    K("LC-RC-K"): K("LC-UP"),
    K("LC-RC-L"): K("LC-RIGHT"),
})

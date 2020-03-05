# -*- coding: utf-8 -*-
import re
from xkeysnail.transform import *

define_modmap({
    Key.ESC: Key.GRAVE,
    Key.CAPSLOCK: Key.LEFT_CTRL,
})

define_multipurpose_modmap({
    Key.LEFT_CTRL: [Key.ESC, Key.LEFT_CTRL],
})

define_conditional_multipurpose_modmap(re.compile(r'Emacs'), {
    Key.LEFT_CTRL: [Key.ESC, Key.LEFT_CTRL],
    Key.LEFT_SHIFT: [Key.F13, Key.LEFT_SHIFT],
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
})

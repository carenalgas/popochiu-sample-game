@tool
extends "res://addons/popochiu/engine/interfaces/i_dialog.gd"

# classes ----
const PDChatWithPopsy := preload("res://game/dialogs/chat_with_popsy/dialog_chat_with_popsy.gd")
# ---- classes

# nodes ----
var ChatWithPopsy: PDChatWithPopsy : get = get_ChatWithPopsy
# ---- nodes

# functions ----
func get_ChatWithPopsy() -> PDChatWithPopsy: return get_instance("ChatWithPopsy")
# ---- functions


@tool
extends "res://addons/popochiu/engine/interfaces/i_dialog.gd"

# classes ----
const PDPopsyTalk := preload('res://game/dialogs/popsy_talk/dialog_popsy_talk.gd')
# ---- classes

# nodes ----
var PopsyTalk: PDPopsyTalk : get = get_PopsyTalk
# ---- nodes

# functions ----
func get_PopsyTalk() -> PDPopsyTalk: return E.get_dialog('PopsyTalk')
# ---- functions


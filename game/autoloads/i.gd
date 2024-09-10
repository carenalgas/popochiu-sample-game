@tool
extends "res://addons/popochiu/engine/interfaces/i_inventory.gd"

# classes ----
const PIIKey := preload("res://game/inventory_items/key/inventory_item_key.gd")
# ---- classes

# nodes ----
var Key: PIIKey : get = get_Key
# ---- nodes

# functions ----
func get_Key() -> PIIKey: return get_item_instance("Key")
# ---- functions


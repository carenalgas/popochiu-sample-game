@tool
extends "res://addons/popochiu/engine/interfaces/i_character.gd"

# classes ----
const PCGoddiu := preload("res://game/characters/goddiu/character_goddiu.gd")
const PCPopsy := preload("res://game/characters/popsy/character_popsy.gd")
# ---- classes

# nodes ----
var Goddiu: PCGoddiu : get = get_Goddiu
var Popsy: PCPopsy : get = get_Popsy
# ---- nodes

# functions ----
func get_Goddiu() -> PCGoddiu: return get_runtime_character("Goddiu")
func get_Popsy() -> PCPopsy: return get_runtime_character("Popsy")
# ---- functions


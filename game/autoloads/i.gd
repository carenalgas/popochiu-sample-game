@tool
extends "res://addons/popochiu/engine/interfaces/i_inventory.gd"

# classes ----
const PIIKey := preload("res://game/inventory_items/key/inventory_item_key.gd")
const PIIToyCar := preload("res://game/inventory_items/toy_car/inventory_item_toy_car.gd")
const PIIApple := preload("res://game/inventory_items/apple/inventory_item_apple.gd")
# ---- classes

# nodes ----
var Key: PIIKey : get = get_Key
var ToyCar: PIIToyCar : get = get_ToyCar
var Apple: PIIApple : get = get_Apple
# ---- nodes

# functions ----
func get_Key() -> PIIKey: return get_item_instance("Key")
func get_ToyCar() -> PIIToyCar: return get_item_instance("ToyCar")
func get_Apple() -> PIIApple: return get_item_instance("Apple")
# ---- functions


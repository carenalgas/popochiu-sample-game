@tool
extends "res://addons/popochiu/engine/interfaces/i_inventory.gd"

# classes ----
const PIIKey := preload('res://game/inventory_items/key/inventory_item_key.gd')
const PIIApple := preload('res://game/inventory_items/apple/inventory_item_apple.gd')
const PIIToyCar := preload('res://game/inventory_items/toy_car/inventory_item_toy_car.gd')
# ---- classes

# nodes ----
var Key: PIIKey : get = get_Key
var Apple: PIIApple : get = get_Apple
var ToyCar: PIIToyCar : get = get_ToyCar
# ---- nodes

# functions ----
func get_Key() -> PIIKey: return super.get_item_instance('Key')
func get_Apple() -> PIIApple: return super.get_item_instance('Apple')
func get_ToyCar() -> PIIToyCar: return super.get_item_instance('ToyCar')
# ---- functions


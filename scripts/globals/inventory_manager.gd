extends Node

signal inventory_changed(inventory: Dictionary)

var inventory: Dictionary = {}


func add_collectable(collectable_name: String) -> void:
    inventory[collectable_name] = inventory.get(collectable_name, 0) + 1
    inventory_changed.emit(inventory)

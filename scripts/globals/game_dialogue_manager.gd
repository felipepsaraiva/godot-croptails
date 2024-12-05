extends Node

signal gave_crop_seeds


func action_give_crop_seeds() -> void:
    gave_crop_seeds.emit()

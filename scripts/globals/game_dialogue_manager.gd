extends Node

signal gave_crop_seeds
signal feed_animals


func action_give_crop_seeds() -> void:
    gave_crop_seeds.emit()


func action_feed_animals() -> void:
    feed_animals.emit()

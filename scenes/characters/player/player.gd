class_name Player
extends CharacterBody2D

@export var current_tool: DataTypes.Tools = DataTypes.Tools.None

var direction: Vector2 = Vector2.DOWN


func _ready() -> void:
    $HitComponent.current_tool = current_tool

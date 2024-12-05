extends CharacterBody2D

@onready var interactable_component: InteractableComponent = $InteractableComponent
@onready var interactable_label_component: Control = $InteractableLabelComponent


func _ready() -> void:
    interactable_component.interactable_activated.connect(on_interactable_activated)
    interactable_component.interactable_deactivated.connect(on_interactable_deactivated)


func on_interactable_activated(_body: Node2D) -> void:
    interactable_label_component.visible = true


func on_interactable_deactivated(_body: Node2D) -> void:
    interactable_label_component.visible = false

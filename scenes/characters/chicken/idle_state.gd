extends NodeState

@export var character: CharacterBody2D
@export var animated_sprite_2d: AnimatedSprite2D

@onready var timer: Timer = $Timer


#func _ready() -> void:
    #timer.wait_time = time_interval
    #timer.timeout.connect(on_timer_timeout)
    #add_child(timer)
    #timer.is_stopped()


func _on_next_transitions() -> void:
    if timer.is_stopped():
        transition.emit('walk')


func _on_enter() -> void:
    animated_sprite_2d.play('idle')
    timer.start()


func _on_exit() -> void:
    timer.stop()
    animated_sprite_2d.stop()

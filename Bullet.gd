extends Area2D


var move = Vector2.ZERO
var look_vec = Vector2.ZERO
var player = null
var speed = 3

func _ready() -> void:
	look_vec = player.position - global_position
	
func _physics_process(delta: float) -> void:
	move = Vector2.ZERO
	
	move -= move.move_toward(-look_vec, delta)
	move = move.normalized() * speed
	position += move





func _on_VisibilityNotifier2D_viewport_exited(viewport: Viewport) -> void:
	queue_free()

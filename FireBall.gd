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
	move = move.normalized() 
	animations()
	move *= speed

	position += move
	

func animations():
	
	if move.x > 0:
		$AnimatedSprite.play("FireR")
	elif move.x < 0:
		$AnimatedSprite.play("FireL")
	elif move.y > 0:
		$AnimatedSprite.play("FireD")
	elif move.y < 0:
		$AnimatedSprite.play("FireU")
	
	

func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()
	

func _on_VisibilityNotifier2D_viewport_exited(viewport: Viewport) -> void:
	queue_free()


func _on_FireBall_body_entered(body: Node) -> void:
	queue_free()

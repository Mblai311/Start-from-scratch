extends KinematicBody2D

var player = null

var hit_counter = 0

var move = Vector2.ZERO
export var speed = 30
export var knockback = 500
var hit = false

func _physics_process(delta: float) -> void:
	move = Vector2.ZERO
	knockback = 500

	if player != null and hit == false:
		move = position.direction_to(player.position) * speed
		move = move.normalized()
		move = move_and_collide(move)
		
	elif player!= null and hit == true:
		if hit_counter > 3:
			knockback = 5000
		
		
			move = position.direction_to(player.position) * -speed
			
			move = move.normalized() * move_toward(500, knockback, delta)
			move = move.move_toward(Vector2.ZERO, delta*0.2)
			move = move_and_slide(move)
			
	else:
		move = Vector2.ZERO
	

func _on_DetectionArea_body_entered(body: Node) -> void:
	if body != self:
		player = body
	#yield(get_tree().create_timer(.1), "timeout")


func _on_DetectionArea_body_exited(body: Node) -> void:
	player = null
	

func _on_HitBox_body_entered(body: Node) -> void:
	hit = true
	hit_counter += 1
	

func _on_HitBox_body_exited(body: Node) -> void:
	hit = false


func _on_FightArea_body_shape_exited(body_id: int, body: Node, body_shape: int, area_shape: int) -> void:
	hit_counter = 0

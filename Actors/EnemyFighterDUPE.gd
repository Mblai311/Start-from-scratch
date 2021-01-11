extends KinematicBody2D

var player = null

var hit_counter = 0

var move = Vector2.ZERO
export var speed = 30
export var knockback = 0
var knockback_var = 1
var knockbackspeed = 70
var invincible = false
var hit = false




func _physics_process(delta: float) -> void:
	if hit_counter == 4:
		hit_counter = 0
	move = Vector2.ZERO
	knockback = 50
	speed = 30

	if player != null and hit == false:
		move_towards()
		
	elif player!= null and hit == true:
		move_away()
		
		
		if hit_counter >=3:
			knockback = 900
			speed = 0
			$AnimationPlayer.play("blink")
			
			move = position.direction_to(player.position)
			
			move = move.normalized() * -knockback # move_toward(500, knockback, delta)
			#move = move.move_toward(move * knockbackspeed , delta ) 
			#move = lerp(Vector2.ZERO, move, 1  )
			move = move_and_slide(move)
			hit_counter = 0
			
			
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
	yield(get_tree().create_timer(.15), "timeout")


func _on_FightArea_body_shape_exited(body_id: int, body: Node, body_shape: int, area_shape: int) -> void:
	hit_counter = 0
	yield(get_tree().create_timer(.1), "timeout")

func move_towards():
	move = position.direction_to(player.position) * speed *2
	move = move.normalized() 
	move = move_and_collide(move) 


func move_away():
	move = position.direction_to(player.position)
	move = move.normalized() * -knockback
	move = move_and_slide(move) 

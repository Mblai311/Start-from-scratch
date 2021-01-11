extends KinematicBody2D

var player = null

var hit_counter = 0

var move = Vector2.ZERO
export var speed = 30
export var knockback = 0
var knockback_vec = Vector2.ZERO
var knockbackspeed = 70
var invincible = false
var hit = false
var t = 0
var attacking = false


func _physics_process(delta: float) -> void:
	t += delta *.4
	if hit_counter == 4:
		hit_counter = 0
	move = Vector2.ZERO
	knockback = 50
	speed = 30

	if player != null and hit == false:
		move_towards()
		
	elif player!= null and hit == true:
		#attacking = true
		move_away()
		
		
		if hit_counter >=3:
			knockback = 1900
		
			$AnimationPlayer.play("blink")
			move_away()
			
			#move = position.direction_to(player.position)
			
			#move = move.normalized()  # move_toward(500, knockback, delta)
			#move = move.move_toward(move * -knockback , delta * 9999) 
			#move = lerp(Vector2.ZERO, move, 1  )
			#move = move.linear_interpolate(move * -knockback, t)
			#move = move_and_slide(move)
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
	
	#yield(get_tree().create_timer(.15), "timeout")


func _on_FightArea_body_shape_exited(body_id: int, body: Node, body_shape: int, area_shape: int) -> void:
	hit_counter = 0
	#attacking = false
	#yield(get_tree().create_timer(.1), "timeout")

func move_towards():
	if attacking == false:
		move = position.direction_to(player.position) * speed *2
		move = move.normalized() 
		move = move_and_collide(move) 


func move_away():
	knockback_vec = position.direction_to(player.position)
	knockback_vec = knockback_vec.normalized() * -knockback 
	knockback_vec = move_and_slide(knockback_vec) 

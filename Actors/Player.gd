extends KinematicBody2D

signal hit

export var velocity: Vector2 = Vector2.ZERO
export var speed = 1000
export var friction = 3000
export var acceleration = 3000 

var is_attacking = false


func _physics_process(delta: float) -> void:
	randomize()	
	var rand = rand_range(0, 1)
	

	var direction = Vector2.ZERO
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	direction = direction.normalized()
	
	velocity = velocity.move_toward(direction * speed, acceleration  * delta) 

	move_and_slide(velocity)
	
	if is_attacking == false:
		if Input.is_action_just_pressed("ui_accept"):
			if rand > 0.65:
				is_attacking = true
				$HitBox/CollisionShape2D.disabled = false
				$AnimatedSprite.play("Attack2")
				yield($AnimatedSprite,"animation_finished")
				is_attacking = false
				$HitBox/CollisionShape2D.disabled = true
			else:
				is_attacking = true
				$HitBox/CollisionShape2D.disabled = false
				$AnimatedSprite.play("Attack1")
				yield($AnimatedSprite,"animation_finished")
				is_attacking = false
				$HitBox/CollisionShape2D.disabled = true
		
	
	
	
	if is_attacking == false:
		if direction > Vector2.ZERO:
			$AnimatedSprite.flip_h = false
			$HitBox/CollisionShape2D.position = Vector2(60, -18)
			$AnimatedSprite.play("Run")
		
		elif direction < Vector2.ZERO:
			$AnimatedSprite.flip_h = true
			$HitBox/CollisionShape2D.position = Vector2(-60, -18)
			$AnimatedSprite.play("Run")	
		
		else: #is_attacking = true
			$AnimatedSprite.play("Idle")
			velocity = velocity.move_toward(Vector2.ZERO, friction * delta) 


func _on_HurtBox_area_entered(area: Area2D) -> void:
	pass#queue_free()
		
			

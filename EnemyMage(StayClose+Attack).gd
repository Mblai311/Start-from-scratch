extends KinematicBody2D

var player = null
var move = Vector2.ZERO
var speed = 10

var in_range = false



onready var BULLET_SCENE = preload("res://FireBall.tscn")

func _physics_process(delta: float) -> void:
	move = Vector2.ZERO
	if in_range == false:
		if player != null:
			move = position.direction_to(player.position) * speed
			
		else:
			move = Vector2.ZERO
			
		move = move.normalized()
		move = move_and_collide(move)
	else:
		move = Vector2.ZERO

	
		

func _on_DetectionArea_body_entered(body: Node) -> void:
	if body != self:
		player = body


func _on_DetectionArea_body_exited(body: Node) -> void:
	player = null
	

func fire():
	var bullet = BULLET_SCENE.instance()
	bullet.position = get_global_position()
	bullet.player = player
	get_parent().add_child(bullet)
	$Timer.set_wait_time(1)


func _on_Timer_timeout() -> void:
	if player != null:
		fire()


func _on_Area2D_body_entered(body: Node) -> void:
	if body != self:
		in_range = true
		


func _on_Area2D_body_exited(body: Node) -> void:
	in_range = false

extends Area2D



onready var player_node = get_parent().get_node("Player")
export var speed = 100
var player_loc


func _ready() -> void:
	pass
	

func _physics_process(delta: float) -> void:
	player_loc = player_node.position
	var move = Vector2.ZERO
	
	move = get_global_position().direction_to(player_loc)
	move = move.normalized() * speed * delta
	
	
	
	if move.x > 0:
		$AnimatedSprite.play("FireR")
	elif move.x < 0:
		$AnimatedSprite.play("FireL")
	elif move.y > 0:
		$AnimatedSprite.play("FireD")
	elif move.y < 0:
		$AnimatedSprite.play("FireU")
	elif move.x == player_loc.x:
		queue_free()
	elif move.y == player_loc.y:
		queue_free()
	
		
	elif move.x > 0 and move.y > 0:
		$AnimatedSprite.play("FireDR")
	elif move.x > 0 and move.y < 0:
		$AnimatedSprite.play("FireUR")
	elif move.x < 0 and move.y > 0:
		$AnimatedSprite.play("FireDL")
	elif move.x > 0 and move.y > 0:
		$AnimatedSprite.play("FireUL")
	else:
		queue_free()
	
		
	
	global_translate(move)
	


func _on_HurtBox_area_entered(area: Area2D) -> void:
	queue_free()

extends Node2D


onready var fireball = preload("res://FireBall.tscn")


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_EnemyMage_attack() -> void:
	var fireball_inst = fireball.instance()
	self.add_child(fireball_inst)
	yield(get_tree().create_timer(2),"timeout")
	

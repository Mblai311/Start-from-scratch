extends Area2D



func _ready() -> void:
	#Walk to the right
	$AnimationPlayer.play("walk")
	yield($AnimationPlayer, "animation_finished")
	
	#Show Dialog Box
	$Dialog_Player/Dialog_Box.visible = true



	

	


extends Area2D



	
func _ready() -> void:
	pass



func _on_Dialog_Player_2_done2() -> void:
	$AnimationPlayer.play("walk")
	yield($AnimationPlayer,"animation_finished")
	$NPC_textbox_2/Dialog_Box.visible = true

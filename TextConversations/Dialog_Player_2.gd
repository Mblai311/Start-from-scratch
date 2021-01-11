extends Node

signal done2

var dialog = ["ENEMY1", "ENEMY2", "ENEMY_LAST","NPC4", "NPC5","NPC6", "NPC_LAST", 
"my dude", "come the fuck on", "i dont wanna do shit either!", "and man... take it easy -_-", " shit was harsh", "NOT SHOWN"]
var dialog_page = 0


func _ready() -> void:
	$Dialog_Box/Body_NinePatchRect/Speaker_NinePatchRect/Speaker_Label.text = "Enemy Bitch"
	$Dialog_Box/Body_NinePatchRect/MarginContainer/Body_Label.text = dialog[0]
	

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("next"):
		dialog_page += 1
		$Dialog_Box/Body_NinePatchRect/MarginContainer/Body_Label.text = dialog[dialog_page]
		if dialog_page == len(dialog) -1:
			emit_signal("done2")
			queue_free()


func _on_NPC_textbox_doneNPC() -> void:
	$Dialog_Box.visible = true

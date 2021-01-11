extends Node

signal done

var dialog = ["Smile, you dumb bitch", "this is your life now", "I'll pass it off to my main man Jim and he will let you the rules", "NOT SHOWN"]
var dialog_page = 0


func _ready() -> void:
	$Dialog_Box/Body_NinePatchRect/Speaker_NinePatchRect/Speaker_Label.text = "Enemy Bitch #436"
	$Dialog_Box/Body_NinePatchRect/MarginContainer/Body_Label.text = dialog[0]
	

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("next"):
		dialog_page += 1
		$Dialog_Box/Body_NinePatchRect/MarginContainer/Body_Label.text = dialog[dialog_page]
		if dialog_page == len(dialog) -1:
			emit_signal("done")
			queue_free()

extends Node

signal doneNPC

var dialog = ["ENEMY1", "ENEMY2", "ENEMY","I'm not gonna show anyone shit", "you fuck bitch whore",
"sluts bitch ass nigga", "I am Jim though", "NOT SHOWN"
]
var dialog_page = 0


func _ready() -> void:
	$Dialog_Box/Body_NinePatchRect/Speaker_NinePatchRect/Speaker_Label.text = "Jim"
	$Dialog_Box/Body_NinePatchRect/MarginContainer/Body_Label.text = dialog[0]
	

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("next"):
		dialog_page += 1
		$Dialog_Box/Body_NinePatchRect/MarginContainer/Body_Label.text = dialog[dialog_page]
		if dialog_page == len(dialog) -1:
			queue_free()
			emit_signal("doneNPC")
		



func _on_Dialog_Player_done() -> void:
	$Dialog_Box.visible = true

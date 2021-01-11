extends Node


var dialog = ["ENEMY1", "ENEMY2", "ENEMY_LAST3","NPC4", "NPC5","NPC6", "NPC_LAST7", 
"ENEMY8", "ENEMY9", "ENEMY10", "ENEMY11", "ENEMY_LAST12", "...Fuck you", "you dirt shit bastard", "...",
"sorry sorry hahha", "whatever man ill do what i can"," this new system isnt that bad ngl", "NOT SHOWN"]
var dialog_page = 0


func _ready() -> void:
	$Dialog_Box/Body_NinePatchRect/Speaker_NinePatchRect/Speaker_Label.text = "Jim: Asshole"
	$Dialog_Box/Body_NinePatchRect/MarginContainer/Body_Label.text = dialog[0]
	

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("next"):
		dialog_page += 1
		$Dialog_Box/Body_NinePatchRect/MarginContainer/Body_Label.text = dialog[dialog_page]
		if dialog_page == len(dialog) -1:
			queue_free()
			#get_tree().change_scene("res://World2.tscn")
		
		
		
		
	
	 


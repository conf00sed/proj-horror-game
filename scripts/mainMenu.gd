extends PanelContainer

#func _ready():
	##hide()
	#pass
	
func _process(delta):
	if Input.is_action_just_pressed("esc"):
		if visible:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
			get_tree().paused = false
			hide()
		else:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
			get_tree().paused = true
			show()



func _on_new_game_button_down():
	$"../../Player/".camera.make_current()
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	hide()
	


func _on_quit_button_down():
	get_tree().quit()
	pass # Replace with function body.

extends Node

func _unhandled_input(event):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()	

func _ready(): 
	$Camera3D.make_current()

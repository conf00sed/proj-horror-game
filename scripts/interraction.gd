extends Area3D

var inside : bool

func _on_body_entered(body):
	inside = true
	get_tree().create_tween().tween_property($Label, "rotation", Vector3(), .5)
	get_tree().create_tween().tween_property($Label, "scale", Vector3(1, 1, 1), .5)

func _on_body_exited(body):
	inside = false
	get_tree().create_tween().tween_property($Label, "rotation", Vector3(0, 0, 0), .5)
	get_tree().create_tween().tween_property($Label, "scale", Vector3(), .5)

func _process(delta):
	if Input.is_action_just_pressed("interact"):
		queue_free()

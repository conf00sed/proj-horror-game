extends Area3D



func _on_body_entered(body):
	$AudioStreamPlayer3D.playing = true
	get_tree().create_tween().tween_property($AudioStreamPlayer3D, "position", Vector3(), 1)

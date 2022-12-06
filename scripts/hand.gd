extends Node3D

@onready var anim : AnimationPlayer = $AnimationPlayer
var count: int = 3
	

func _on_area_3d_body_entered(body):
	count -= 1
	if count == 0:
		anim.play("ArmatureAction")
		$AudioStreamPlayer3D.playing = true
		get_tree().create_tween().tween_property(self, "position:y", 0.638, 0.25)
		

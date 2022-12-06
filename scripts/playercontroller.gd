extends CharacterBody3D

@onready var camera = $Camera3D
@onready var footsteps = $AudioStreamPlayer3D

var SPEED = 3
const JUMP_VELOCITY = 8

var gravity = 20

func _ready():
	#Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	footsteps.stream_paused = true
	
func _unhandled_input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * .005)
		camera.rotate_x(-event.relative.y * .005)
		camera.rotation.x = clamp(camera.rotation.x, -PI/2, PI/2) 
	
func _process(delta):
	$"../CanvasLayer/Speedometer/MarginContainer/Label".text = "vel: " + str(int(velocity.x))
	
	if velocity != Vector3.ZERO and is_on_floor():
		footsteps.stream_paused = false
	else: footsteps.stream_paused = true
	

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_pressed("shift"): SPEED = 6
	else: SPEED = 3
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "up", "down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

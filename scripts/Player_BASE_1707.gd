extends KinematicBody


export var speed := 6
export var running_speed := 12
export var gravity := -30
export var jump_impulse := 25

var velocity = Vector3.ZERO

onready var pivot := $Pivot

func _ready():
	var player := $Pivot/MeshInstance
	player.global_transform.origin
	


func _physics_process(delta):
	var input_vector = get_input_Vector()
	apply_movement(input_vector)
	apply_gravity(delta)
	#velocity = move_and_collide(velocity)
	velocity = move_and_slide_with_snap(velocity, Vector3.UP, Vector3.UP, true)
	

func get_input_Vector():
	var input_vector = Vector3.ZERO
	input_vector.x = Input.get_action_strength("move_r") - Input.get_action_strength("move_l")
	input_vector.z = Input.get_action_strength("move_bw") - Input.get_action_strength("move_fw")

	return input_vector.normalized()

func apply_movement(input_vector):

	velocity.x = input_vector.x * speed
	velocity.z = input_vector.z * speed
	
	if(input_vector != Vector3.ZERO):
		pivot.look_at(translation + input_vector, Vector3.UP)


func apply_gravity(delta):
	velocity.y += gravity * delta

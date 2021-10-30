extends KinematicBody

export var rotate_speed := 0.1
var velocity = Vector3.ZERO

onready var pivot := $Pivot
onready var player := $Player


func _physics_process(delta):
	var rotation_vector = get_rotation_vector()
	rotate_player(rotation_vector)
	
	var vec = Vector3.ZERO
	vec.y = Input.get_action_strength("rotate_r") - Input.get_action_strength("rotate_l")
	print(vec)
	
	
func get_input_Vector():
	var input_vector = Vector3.ZERO
	input_vector.y = Input.get_action_strength("rotate_r") - Input.get_action_strength("rotate_l")
	input_vector.z = Input.get_action_strength("move_bw") - Input.get_action_strength("move_fw")
	
func get_rotation_vector():
	var rotation_vector = Vector3.ZERO
	rotation_vector.y = Input.get_action_strength("rotate_l") - Input.get_action_strength("rotate_r")
	
	return rotation_vector.normalized()

func rotate_player(rotation_vector):
	if(rotation_vector != Vector3.ZERO):
		pivot.rotate(rotation_vector, rotate_speed)



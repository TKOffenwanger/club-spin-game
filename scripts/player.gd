extends CharacterBody3D


const SPEED = 5.0
const WEAPON_LIFT = 15.0
var club_active: bool = false
@onready var club: RigidBody3D = $"../Club"


func _input(event):
	if(event.is_action_pressed("attack_hold")):
		club.angular_damp = 1
		club.gravity_scale = 0.2
	elif(event.is_action_released("attack_hold")):
		club.angular_damp = 50
		club.gravity_scale = 1

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	move_and_slide()
	
	if(Input.is_action_pressed("attack_hold")):
		var mouse_dir_from_player = (get_viewport().get_mouse_position() - 
			get_viewport().get_camera_3d().unproject_position(global_position)).normalized()
		#var club_pos_from_player = club.position - position
		mouse_dir_from_player *= WEAPON_LIFT
		club.apply_central_force(Vector3(mouse_dir_from_player.x, 0, mouse_dir_from_player.y))
		#var vect = Vector3(0, mouse_dir_from_player.y, mouse_dir_from_player.x)
		
		

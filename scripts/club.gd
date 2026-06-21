extends RigidBody3D

var _velocity_last_step:Vector3

func _physics_process(delta):
	_velocity_last_step = linear_velocity

func _on_hurtbox_body_entered(body):
	if body is Enemy:
		body.get_hit_and_die(_velocity_last_step)

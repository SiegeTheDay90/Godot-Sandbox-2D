extends RigidBody2D


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	position.y += gravity * delta

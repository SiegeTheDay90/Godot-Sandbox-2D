extends RigidBody2D


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
print(gravity)


func _process(delta):
	position.y += gravity * delta

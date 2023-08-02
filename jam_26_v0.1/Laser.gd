extends StaticBody2D
var dir = Vector2(0, 0)
var SPEED = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += dir*SPEED*delta
	rotate(0.05*delta*SPEED)
	pass


func _on_timer_timeout():
	queue_free()
	pass # Replace with function body.


func _on_area_2d_body_entered(body):
	if body.name == "PlayerShip":
		get_tree().change_scene_to_file("res://splash.tscn")
	pass # Replace with function body.

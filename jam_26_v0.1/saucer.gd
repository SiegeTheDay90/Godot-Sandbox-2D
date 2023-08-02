extends StaticBody2D

var SPEED = 200
var dir = Vector2(0, 1)
var count = 0
var Laser = load("res://jam_26_v0.1/Laser.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	dir.y = sin(count)
	count += 0.08
	position += SPEED*dir*delta

func shoot():
	var laser = Laser.instantiate()
	laser.dir = Vector2(1, 1)
	add_sibling(laser)
	laser.set_global_position(global_position)
	
	laser = Laser.instantiate()
	laser.dir = Vector2(-1, 1)
	add_sibling(laser)
	laser.set_global_position(global_position)
	
	laser = Laser.instantiate()
	laser.dir = Vector2(1, -1)
	add_sibling(laser)
	laser.set_global_position(global_position)
	
	laser = Laser.instantiate()
	laser.dir = Vector2(-1, -1)
	add_sibling(laser)
	laser.set_global_position(global_position)
#	missile.global_position.x += 45
	pass


func _on_shoot_timeout():
	shoot()
	pass # Replace with function body.


func _on_area_2d_body_entered(body):
	if body.name.substr(0,7) == "Missile":
		queue_free()
		body.get_node("AnimatedSprite2D").play("Explode")
		body.get_node("HitBox").queue_free()
		body.linear_velocity = -20
		await body.get_node("AnimatedSprite2D").animation_finished
		body.queue_free()
	pass # Replace with function body.

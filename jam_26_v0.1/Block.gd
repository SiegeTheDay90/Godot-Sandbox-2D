extends RigidBody2D


func _on_area_2d_body_entered(body):
	if body.name.substr(0,7) == "Missile":
		queue_free()
		body.get_node("AnimatedSprite2D").play("Explode")
		body.get_node("HitBox").queue_free()
		body.linear_velocity = -20
		await body.get_node("AnimatedSprite2D").animation_finished
		body.queue_free()


func _on_area_2d_2_body_entered(body):
	if body.name == "PlayerShip":
		get_tree().change_scene_to_file("res://splash.tscn")
	pass # Replace with function body.

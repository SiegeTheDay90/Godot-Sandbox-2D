extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var Missile = load("res://jam_26_v0.1/missile.tscn")
var ableTo = {"shoot": true}

@onready var anim = get_node("AnimatedSprite2D")

func _physics_process(_delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = {"x": Input.get_axis("ui_left", "ui_right"), "y": Input.get_axis("ui_up", "ui_down")}
	if direction.x or direction.y:
		velocity.x = direction.x * SPEED
		velocity.y = direction.y * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED/10)
		velocity.y = move_toward(velocity.y, 0, SPEED/10)
	if Input.is_action_just_pressed("ui_accept"):
		if ableTo["shoot"]:
			ableTo["shoot"] = false
			var missile = Missile.instantiate()
			add_sibling(missile)
			missile.set_global_position(global_position)
			missile.linear_velocity = 40.0 if velocity.x < 40 else velocity.x
			missile.global_position.x += 60
			get_node("canShoot").start()

	move_and_slide()

func _process(_delta):
	if Input.is_action_just_pressed("ui_up"):
		anim.play("Up")
	elif Input.is_action_just_pressed("ui_down"):
		anim.play("Down")
	elif Input.is_action_just_released("ui_up"):
		anim.play("Up", -2.0, true)
	elif Input.is_action_just_released("ui_down"):
		anim.play("Down", -2.0, true)
		
		
		
		




func _on_animated_sprite_2d_animation_finished():
	anim.pause()
	pass # Replace with function body.


func _on_can_shoot_timeout():
	ableTo["shoot"] = true
	pass # Replace with function body.

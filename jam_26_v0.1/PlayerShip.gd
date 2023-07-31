extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var status = "Idle"
var Missile = load("res://jam_26_v0.1/missile.tscn")
var missiles = []
@onready var anim = get_node("AnimatedSprite2D")
# export(PackedScene) var missile_scene


func _physics_process(_delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = {"x": Input.get_axis("ui_left", "ui_right"), "y": Input.get_axis("ui_up", "ui_down")}
	if direction:
		velocity.x = direction.x * SPEED
		velocity.y = direction.y * SPEED
		if velocity.y > 0 and status != "Up":
			anim.play("Up")
		elif velocity.y < 0 and status != "Down":
			anim.play("Down")
		elif velocity.y == 0:
			anim.play("Idle")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED/20)
	
	if Input.is_action_just_pressed("ui_accept"):
		var missile = Missile.instantiate()
		add_sibling(missile)
		missile.set_global_position(global_position)
		missile.linear_velocity = 20 if velocity.x < 20 else velocity.x
		missile.global_position.x += 38
		missiles.push_front(missile)

	move_and_slide()
		
		
		
		



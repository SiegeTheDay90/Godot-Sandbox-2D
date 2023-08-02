extends StaticBody2D

var SPEED = 300
var linear_velocity = 40.0
@onready var anim = get_node("AnimatedSprite2D")

	
# Called when the node enters the scene tree for the first time.
func _ready():
	name = "Missile"
	var timer = Timer.new()
	timer.wait_time = 1.0
	timer.connect("timeout", destroy)
	add_child(timer)
	timer.start()
	pass # Replace with function body.

func destroy():
	if self.has_node("HitBox"):
		linear_velocity = -10
		self.get_node("HitBox").queue_free()
		anim.play("Explode")
		await anim.animation_finished
		self.queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if linear_velocity < 700:
		linear_velocity *= 1.12
		
	position.x += linear_velocity*delta
	
	pass


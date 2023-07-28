extends RigidBody2D

var interval_timer
var dir = 1
var gravity = 0

func change_dir():
	dir *= -1

# Called when the node enters the scene tree for the first time.
func _ready():
	interval_timer = Timer.new()
	interval_timer.wait_time = 2.0
	interval_timer.connect("timeout", change_dir)
	interval_timer.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _physics_process(delta):
	if dir == 1:
		self.linear_velocity.x = 200
	else:
		self.linear_velocity.x = -200
	self.linear_velocity.y = 0

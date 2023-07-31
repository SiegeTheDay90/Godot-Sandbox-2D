extends StaticBody2D

var SPEED = 150
var dir = 1
var interval_timer

# Called when the node enters the scene tree for the first time.
func _ready():
	interval_timer = Timer.new()
	add_child(interval_timer)
	interval_timer.wait_time = 4.0
	interval_timer.connect("timeout", change_dir)
	interval_timer.start()
	constant_linear_velocity = Vector2(dir*SPEED, 0)
func change_dir():
	dir *= -1


# Called every frame. 'delta' is the elapsed time since the previous frame. 
func _process(delta):
	self.position.x += dir*SPEED*delta
	constant_linear_velocity = Vector2(dir*SPEED, 0)

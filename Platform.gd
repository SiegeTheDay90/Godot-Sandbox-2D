extends StaticBody2D

var moveCount = 0
var dir = 1
var interval_timer

# Called when the node enters the scene tree for the first time.
func _ready():
	interval_timer = Timer.new()
	add_child(interval_timer)
	interval_timer.wait_time = 2.0
	interval_timer.connect("timeout", change_dir)
	interval_timer.start()
	
func change_dir():
	dir *= -1

# Called every frame. 'delta' is the elapsed time since the previous frame. 
func _process(delta):
	self.position.x += dir
	
	
	

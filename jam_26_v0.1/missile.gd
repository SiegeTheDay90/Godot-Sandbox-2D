extends StaticBody2D

var SPEED = 300
var linear_velocity = 20


	#print("This is a Missile")
#	self.global_position = pos
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if linear_velocity < 500:
		linear_velocity *= 1.08
		
	position.x += linear_velocity*delta
	
	pass

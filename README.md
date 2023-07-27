# Godot-Sandbox-2D
Open the project in Godot 4+ to test and play. <br>
Want to test something new? Make a branch or fork the repo.

# Current Features
* Moveable Player
* Moving Platform
* Sloped Platforms

## Moving Platform
* Uses `Timer` node to change directions.

```
extends StaticBody2D

var SPEED = 150
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
	self.position.x += dir*SPEED*delta
```
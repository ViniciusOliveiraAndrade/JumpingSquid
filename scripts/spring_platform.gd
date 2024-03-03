extends "res://scripts/grass_platform.gd"

func response():
	$Spring.play("default")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_spring_animation_finished():
	$Spring.stop()
	$Spring.frame = 0

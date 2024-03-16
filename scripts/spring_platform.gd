extends "res://scripts/grass_platform.gd"

func response():
	$Spring.play("default")

func _on_spring_animation_finished():
	$Spring.stop()
	$Spring.frame = 0

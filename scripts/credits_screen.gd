extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_touch_screen_button_pressed():
	if get_tree().change_scene_to_file("res://scenes/title_screen.tscn") != OK:
		print("Não foi possivel voltar para tela de título")
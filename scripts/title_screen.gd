extends Control

@onready var highscore := $Main_Container_V/High_Score as Label

# color R:23 G:176 B:227 A:161
func _ready():
	highscore.text = "HIGHSCORE\n" + str(Global.highscore)
	
func _on_start_btn_pressed():
	if get_tree().change_scene_to_file("res://scenes/jumping_squid.tscn") != OK:
		print("Algo deu errado e não conseguiu iniciar o jogo")

func _on_quit_btn_pressed():
	get_tree().quit()

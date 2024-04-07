extends Control

var title_screen : PackedScene

func _ready():
	title_screen = preload("res://scenes/title_screen.tscn")
	BgAudio.play_music_level()


func _on_touch_screen_button_pressed():
	TransitionScene.change_to_scene(title_screen)
	#if get_tree().change_scene_to_file("res://scenes/title_screen.tscn") != OK:
		#print("Não foi possivel voltar para tela de título")

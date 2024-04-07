extends Control

@onready var highscore := $Main_Container_V/High_Score as Label
var game_scene : PackedScene
var credits_scene : PackedScene

# color R:23 G:176 B:227 A:161
func _ready():
	highscore.text = "HIGHSCORE\n" + str(Global.highscore)
	game_scene = preload("res://scenes/jumping_squid.tscn")
	credits_scene = preload("res://scenes/credits_screen.tscn")
	#$AudioStreamPlayer.play()
	BgAudio.play_music_level()
	
func _on_start_btn_pressed():
	#if get_tree().change_scene_to_file("res://scenes/jumping_squid.tscn") != OK:
		#print("Algo deu errado e não conseguiu iniciar o jogo")
	TransitionScene.change_to_scene(game_scene)
	
func _on_quit_btn_pressed():
	get_tree().quit()

func _on_credits_btn_pressed():
	#if get_tree().change_scene_to_file("res://scenes/credits_screen.tscn") != OK:
		#print("Algo deu errado e não conseguiu carregar tela de créditos")
	TransitionScene.change_to_scene(credits_scene)

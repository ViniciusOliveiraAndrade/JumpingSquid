extends Control

var title_screen : PackedScene

func _ready():
	SaveLoadData.load_data()
	$AnimationPlayer.play('fade_out')
	await $AnimationPlayer.animation_finished
	title_screen = preload("res://scenes/title_screen.tscn")
	$AnimationPlayer.play('fade_in')
	
	

func _on_animation_player_animation_finished(anim_name):
	#if anim_name == "fade_out":
		#$AnimationPlayer.play("fade_in")
	if anim_name == "fade_in":
		get_tree().change_scene_to_packed(title_screen)
	

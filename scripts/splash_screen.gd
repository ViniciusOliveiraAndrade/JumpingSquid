extends Control

func _ready():
	SaveLoadData.load_data()

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fade_out":
		$AnimationPlayer.play("fade_in")
	if anim_name == "fade_in":
		get_tree().change_scene_to_file("res://.godot/exported/133200997/export-c315eff7b5f8a8ce1d6c4c72650ddc19-title_screen.scn")

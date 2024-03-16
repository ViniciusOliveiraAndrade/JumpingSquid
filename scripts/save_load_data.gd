extends Node

var playerData := PlayerData.new()

func _ready():
	verify_save_directory(Global.save_path)
	
func verify_save_directory(path : String):
	DirAccess.make_dir_absolute(path)
	
func save_data():
	playerData.highscore = Global.highscore
	ResourceSaver.save(playerData, Global.save_path + playerData.save_name )
	
func load_data():
	if not FileAccess.file_exists(Global.save_path + playerData.save_name):
		return
	else:
		playerData = ResourceLoader.load(Global.save_path + playerData.save_name).duplicate(true)
		Global.highscore = playerData.highscore

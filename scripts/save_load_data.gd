extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	load_data()
	
func save_data():
	var data ={
		"highscore" : Global.highscore
	}
	var save_file = FileAccess.open(Global.save_path,FileAccess.WRITE)
	var json_data = JSON.stringify(data)
	save_file.store_line(json_data)
	save_file.close()
	#print("----")
	#print(data)
	#print("----")
	
func load_data():
	if not FileAccess.file_exists(Global.save_path):
		return
	else:
		var save_file = FileAccess.open(Global.save_path,FileAccess.READ)
		while save_file.get_position() < save_file.get_length():
			var data_saved = save_file.get_line()
			var json_data = JSON.new()
			json_data.parse(data_saved)
			var data = json_data.get_data()
			Global.highscore = data.highscore
			#print("----")
			#print(data.highscore)
			#print("----")
		save_file.close()

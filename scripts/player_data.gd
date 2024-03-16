extends Resource
class_name PlayerData

@export var highscore := 0

var save_name = "PlayerSave.tres"

func update_highscore(value : int):
	highscore = value

extends CanvasLayer

@onready var animation = $AnimationPlayer

func _ready():
	self.hide()

func change_to_scene(target: PackedScene):
	self.show()
	#get_tree().paused = true
	animation.play("fade_in")
	await animation.animation_finished
	#get_tree().paused = false
	if get_tree().change_scene_to_packed(target) != OK:
		print("Não foi possivel ir para a Scene: " + target.resource_path)
	animation.play("fade_out")
	


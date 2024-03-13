extends Node2D

@onready var platform_container := $Platform_Container as Node2D
@onready var platform_initial_position_y =  $Platform_Container/Grass_Platform.position.y
@onready var camera := $Camera as Camera2D
@onready var player := $Player as CharacterBody2D
@onready var score_label := $Camera/Score as Label
@onready var camera_start_position = $Camera.position.y


@export var platform_scene : Array[PackedScene]

var last_platform_is_cloud := false 
var last_platform_is_enemy := false 
var created_platform := 0
var score := 0

func level_generator(amount):
	for itens in amount:
		var new_type = randi() % 4
		
		#print(platform_initial_position_y)
		platform_initial_position_y -= randi_range(36,54)
		var new_platform 
		if new_type == 0:
			new_platform = platform_scene[0].instantiate()
			created_platform += 1
		elif new_type == 1:
			new_platform = platform_scene[1].instantiate()
			created_platform += 1
		elif new_type == 2 and created_platform > 20:
			
#			if !last_platform_is_cloud:
#				new_platform = platform_scene[2].instantiate()
#				new_platform.connect("delete_object", Callable(self, "delete_object"))
#				last_platform_is_cloud = true
#			else: 
#				new_platform = platform_scene[0].instantiate()
#				last_platform_is_cloud = false
				
			new_platform = platform_scene[2].instantiate()
			new_platform.connect("delete_object", Callable(self, "delete_object"))
		else:
			if !last_platform_is_enemy and created_platform > 30:
				new_platform = platform_scene[3].instantiate()
				new_platform.connect("delete_object", Callable(self, "delete_object"))
				last_platform_is_enemy = true
			else: 
				new_platform = platform_scene[0].instantiate()
				last_platform_is_enemy = false
		if new_type != null:
			new_platform.position = Vector2(randi_range(20,160),platform_initial_position_y)
			platform_container.call_deferred("add_child",new_platform)

func delete_object(obstacle):
	if obstacle.is_in_group("player"):
		print("Player morto")
#		get_tree().reload_current_scene()
		obstacle.die()
		if Global.highscore < score:
			Global.highscore = score
			SaveLoadData.save_data()
		if get_tree().change_scene_to_file("res://scenes/title_screen.tscn") != OK:
			print("Não foi possivel voltar para tela inicial")
	elif obstacle.is_in_group("platform") or obstacle.is_in_group("enemies"):
		obstacle.queue_free()
		level_generator(1)
	
func score_update():
	score = camera_start_position - camera.position.y
	score_label.text = str(score)
	
func  _ready():
	level_generator(20)

@warning_ignore("unused_parameter")
func _physics_process(delta):
	if player.position.y < camera.position.y:
		camera.position.y = player.position.y
		score_update()


func _on_platform_cleaner_body_entered(body):
	delete_object(body)
	

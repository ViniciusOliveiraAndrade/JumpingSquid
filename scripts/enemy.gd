extends "res://scripts/grass_platform.gd"

var direction := Vector2.RIGHT
var velocity := Vector2.ZERO
@export var speed := 100
@onready var animator := $Animator as AnimatedSprite2D


func movement(delta):
	velocity = direction * speed
	position += velocity * delta

	if position.x >= 180 or position.x <= 0:
		direction *=-1
		animator.flip_h = !animator.flip_h

func _physics_process(delta):
	movement(delta)

func response():
	emit_signal("delete_object",self)
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_hitbox_body_entered(body):
	if body.is_in_group("player") and body.has_method("die"):
		body.die()

extends CharacterBody2D

const GRAVITY := 10

var jump_force := 400
var speed := 100

@onready var animator := $Animator as AnimatedSprite2D
@onready var screen_size = DisplayServer.window_get_size()

func move(delta):
	var input_direction = 0
	
	if input_direction != 0:
		velocity.x = lerp(velocity.x, input_direction * speed, 0.5)
		animator.scale.x = -input_direction
	else:
		velocity.x = lerp(velocity.x, 0.0, 0.5)
	
	# faz o boneco cair
	velocity.y += GRAVITY
	
	# Realiza a atualização da gravidade e retorna se colidiu
	var collision = move_and_collide(velocity * delta)
	
	#Verifica se sar caindo e muda a animação
	if velocity.y > 0:
		animator.play("falling")
	else:
		animator.play("idle")
	
	# caso colidiu ele faz com que o personagem pule
	if collision:
		velocity.y = -jump_force * collision.get_collider().jump_force
		if collision.get_collider().has_method("response"):
			collision.get_collider().response()
	
func _physics_process(delta):
	move(delta)
	position.x = wrap(position.x, 0, screen_size.x)
	
func die():
#	get_tree().reload_current_scene()
	velocity = Vector2.ZERO
	set_collision_mask_value(1,false)
	set_collision_mask_value(2,false)

extends CharacterBody2D

const SPEED = 100

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	
	# Get the input directions for vertical and horizontal movement: -1, 0 or 1 
	var vert_direction := Input.get_axis("move_up", "move_down")
	var horz_direction := Input.get_axis("move_left", "move_right")

	# Flip the sprite
	if horz_direction > 0:
		animated_sprite.flip_h = false
	elif horz_direction < 0:
		animated_sprite.flip_h = true


	# Play animations
	if vert_direction == 0 && horz_direction == 0:
		animated_sprite.play("front_idle")
	elif vert_direction == 1 && horz_direction == 0:
		animated_sprite.play("front_walk")
	elif vert_direction == 0 && horz_direction == 1 || horz_direction == -1:
		animated_sprite.play("side_walk")
	

	# Apply movement
	if vert_direction:
		velocity.y = vert_direction * SPEED
	else:
		velocity.y = move_toward(velocity.x, 0, SPEED)
	
	
	if horz_direction:
		velocity.x = horz_direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		

	
	move_and_slide()

extends CharacterBody2D

const SPEED = 60.0

var direction = 1

@onready var ray_cast_left = $RayCastLeft
@onready var ray_cast_right = $RayCastRight
@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add gravity so the slime actually falls to the floor
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle wall detection and turning
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	elif ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false

	# Apply the horizontal movement
	velocity.x = direction * SPEED
	
	# Actually execute the physics collision math
	move_and_slide()

extends Area2D

@onready var timer = $Timer

@onready var death_sound: AudioStreamPlayer = $DeathSound

func _on_body_entered(body: Node2D) -> void:
	death_sound.play()

	Engine.time_scale = 0.5

	if body.is_in_group("Player") or body.name == "Player":
		body.set_deferred("collision_layer", 0)
		body.set_deferred("collision_mask", 0)
	
	timer.start()


func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()

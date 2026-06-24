extends Area2D

# Define a custom signal
signal collected

@onready var animation_player = $AnimationPlayer

func _on_body_entered(_body: Node2D) -> void:
	emit_signal("collected")
	animation_player.play("pickup")

extends Area2D



func _on_Block_body_entered(body):
	if body.get_name() == "Player":
		queue_free()

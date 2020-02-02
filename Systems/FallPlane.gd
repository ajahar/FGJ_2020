extends Area2D

func _on_FallPlane_body_entered(body):
	
	print("Fall plane entered")
	if body.name == "Rat":
		GameManager.game_over()
	else:
		GameManager.block_hit()
		body.queue_free()


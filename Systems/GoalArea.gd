extends Area2D

func _on_GoalArea_body_entered(body):
	
	print("Goal area entered!")
	print(body.name)
	if body.name == "Rat":
		GameManager.goal_reached()

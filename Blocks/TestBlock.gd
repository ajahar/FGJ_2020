extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _integrate_forces(state):
	if Input.is_action_pressed("ui_left"):
		state.apply_central_impulse(Vector2.LEFT * 3)
	if Input.is_action_pressed("ui_right"):
		state.apply_central_impulse(Vector2.RIGHT * 3)

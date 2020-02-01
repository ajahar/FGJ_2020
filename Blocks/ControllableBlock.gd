extends RigidBody2D

export var speed = 3  # How fast the player will move (pixels/sec).
var screen_size  # Size of the game window.

var controllable = true

func _ready():
	screen_size = get_viewport_rect().size
	
func _integrate_forces(state):
	if !controllable:
		return
		
	if Input.is_action_pressed("ui_left"):
		state.apply_central_impulse(Vector2.LEFT * speed)
	if Input.is_action_pressed("ui_right"):
		state.apply_central_impulse(Vector2.RIGHT * speed)
	# TODO: Clamp?


func on_body_entered(body):
	if controllable:
		mode = RigidBody2D.MODE_KINEMATIC
		controllable = false

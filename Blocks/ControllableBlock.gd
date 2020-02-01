extends RigidBody2D

export var controllable = true
export var speed = 3  # How fast the player will move (pixels/sec).
var screen_size  # Size of the game window.

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
		set_deferred("mode", RigidBody2D.MODE_RIGID)
		controllable = false

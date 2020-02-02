extends RigidBody2D

export var controllable = true
export var speed = 3  # How fast the player will move (pixels/sec).

const BLOCK_GRAVITY_SCALE = 0.4

var screen_size  # Size of the game window.

func _ready():
	gravity_scale = BLOCK_GRAVITY_SCALE
	screen_size = get_viewport_rect().size
	connect("body_entered", self, "on_body_entered")


func _integrate_forces(state):
	if !controllable:
		return
		
	if Input.is_action_pressed("ui_left"):
		state.apply_central_impulse(Vector2.LEFT * speed)
	if Input.is_action_pressed("ui_right"):
		state.apply_central_impulse(Vector2.RIGHT * speed)
	# TODO: Clamp?


func on_body_entered(body):
	
	print(body.name) # Test given node for timok
	
	if controllable:
		set_deferred("mode", RigidBody2D.MODE_RIGID)
		controllable = false
		GameManager.block_hit()

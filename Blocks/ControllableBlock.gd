extends RigidBody2D

export var controllable = true
export var speed = 3  # How fast the player will move (pixels/sec).

const BLOCK_GRAVITY_SCALE = 0.4
const MAGIC_BLOCK_STOP_MAX_HEIGHT = 200

var screen_size  # Size of the game window.

func _ready():
	gravity_scale = BLOCK_GRAVITY_SCALE
	#set_deferred("mode", RigidBody2D.MODE_CHARACTER)
	screen_size = get_viewport_rect().size
	connect("body_entered", self, "on_body_entered")
	
	
func _process(delta):
	if can_stop_with_magic_mushroom_powers():
		controllable = false
		set_contact_monitor(false)
		set_deferred("mode", RigidBody2D.MODE_STATIC)
		GameManager.block_hit(true)


func can_stop_with_magic_mushroom_powers():
	return (Input.is_action_just_released("block_stop") && 
			controllable && 
			GameManager.magic_mushrooms > 0 && 
			position.y > MAGIC_BLOCK_STOP_MAX_HEIGHT)


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

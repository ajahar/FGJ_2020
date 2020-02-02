extends KinematicBody2D

var screen_size  # Size of the game window.
const GRAVITY_VEC = Vector2(0, 900)
const FLOOR_NORMAL = Vector2(0, -1)
#TODO: floor_max_angle ?
const SLOPE_SLIDE_STOP = 25.0
const WALK_SPEED = 250 # pixels/sec
const JUMP_SPEED = 200
var linear_vel = Vector2()

func _ready():
	screen_size = get_viewport_rect().size


func _physics_process(delta):

	### MOVEMENT ###

	# Apply gravity
	linear_vel += delta * GRAVITY_VEC
	# Move and slide
	linear_vel = move_and_slide(linear_vel, FLOOR_NORMAL, SLOPE_SLIDE_STOP)
	# Detect if we are on floor - only works if called *after* move_and_slide
	var on_floor = is_on_floor()

	### CONTROL ###

	# Horizontal movement
	var target_speed = 0
	if Input.is_action_pressed("rat_left"):
		target_speed -= 1
	if Input.is_action_pressed("rat_right"):
		target_speed += 1

	target_speed *= WALK_SPEED
	linear_vel.x = lerp(linear_vel.x, target_speed, 0.1)

	# Jumping
	if on_floor and Input.is_action_just_pressed("rat_jump"):
		linear_vel.y = -JUMP_SPEED

	if linear_vel.x < 0:
		$AnimatedSprite.scale.x = -1

	if linear_vel.x > 0:
		$AnimatedSprite.scale.x = 1

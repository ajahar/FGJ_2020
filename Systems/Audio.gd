extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	start_music()
	
func start_music():
	$Music.play()
	
func stop_music():
	$Music.stop()
	
func play_new_game():
	$Open.play()

func play_mouse_run():
	$Start.play()
	
func play_mouse_death():
	$Death.play()

func play_victory():
	$Victory.play()

func play_rotate():
	$MoveClick.play()

func play_move_block():
	$Dragging.play()
	
func play_block_down():
	$BlockDown.play()
	
func play_mushroom():
	$Mushroom.play()
	
func play_rubber():
	$Rubber.play()

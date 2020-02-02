extends Node2D

signal update_message
signal block_hit
signal use_mushroom

var audio

var magic_mushrooms = 4

var game_timer = 0.0
var block_timer = 0.0
var play_time = 0
var spawn_block = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	game_timer += delta
	block_timer += delta
	
	if game_timer > 1.0:
		game_timer = 0.0
		play_time += 1
	
	if block_timer > 3.0 :
		block_timer = 0.0
		if spawn_block:
			spawn_block = false
			emit_signal("block_hit")
		
	# TODO: Show shit UI etc...	
	#emit_signal("update_score", "foobar")

func block_hit(mushroom = false):
	if audio != null && !mushroom:
		audio.play_block_down()
	elif audio != null:
		magic_mushrooms -= 1
		emit_signal("use_mushroom")
		audio.play_mushroom()
	spawn_block = true
	
func goal_reached():
	if audio != null:
		audio.play_victory()
	emit_signal("update_message", "Level clear!")

func game_over():
	if audio != null:
		audio.play_mouse_death()
	emit_signal("update_message", "Game over")

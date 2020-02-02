extends Node2D

signal update_score
signal block_hit

var audio

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

func block_hit():
	if audio != null:
		audio.play_block_down()
	spawn_block = true
	
func goal_reached():
	emit_signal("update_score", "Level clear!")

func game_over():
	emit_signal("update_score", "Game over")

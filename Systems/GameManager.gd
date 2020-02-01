extends Node2D

signal update_score

var game_timer = 0.0
var play_time = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	game_timer += delta
	
	if game_timer > 1.0:
		game_timer = 0.0
		play_time += 1
	
	if play_time == 2:
		emit_signal("update_score", "foobar")

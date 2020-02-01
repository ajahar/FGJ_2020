extends MarginContainer

onready var play_time: Label = get_node("VBoxContainer/PlayTime")
onready var score: Label = get_node("VBoxContainer/Score")

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.connect("update_score", self, "on_update_score")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	play_time.set_text("%s %s" % [GameManager.play_time, GameManager.game_timer])


func on_update_score(signal_text):
	score.set_text(signal_text)

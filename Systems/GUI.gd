extends MarginContainer

onready var mushrooms: Label = get_node("VBoxContainer/Mushrooms")
onready var play_time: Label = get_node("VBoxContainer/PlayTime")
onready var message: Label = get_node("VBoxContainer/Message")

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.connect("update_message", self, "on_update_message")
	GameManager.connect("use_mushroom", self, "on_use_mushroom")
	mushrooms.set_text("Magic Mushrooms: %s" % GameManager.magic_mushrooms)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	play_time.set_text("Time: %s" % GameManager.play_time)

func on_use_mushroom():
	mushrooms.set_text("Magic Mushrooms: %s" % GameManager.magic_mushrooms)

func on_update_message(signal_text):
	message.set_text(signal_text)

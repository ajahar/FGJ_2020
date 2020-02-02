extends Node2D

export (Array, PackedScene) var Blocks

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_block()
	GameManager.connect("block_hit", self, "spawn_block")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func spawn_block():
	var block = Blocks[randi() % Blocks.size()].instance()
	add_child(block)


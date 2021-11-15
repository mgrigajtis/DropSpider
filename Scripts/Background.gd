extends Node2D

var backgrounds = [preload("res://Images/DropSpiderBackground.png"),
preload("res://Images/DropSpiderBackground2.png"),
preload("res://Images/DropSpiderBackground3.png")
]

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	# Select a random background
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var randomNumber = rng.randi_range(0, 2)
	get_node("TextureRect").texture = backgrounds[randomNumber]

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

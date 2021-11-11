extends Node2D

# Declare member variables here. Examples:
var Score = 0
var Difficulty = 1.0
var GamePlaying = false
var InsectSpeed = 10.0
var InsectSpawnTimeInterval = 2.0

func reset_values():
	Score = 0
	
	match Difficulty:
		1.0:
			InsectSpeed = 10.0
			InsectSpawnTimeInterval = 2.0
		1.25:
			InsectSpeed = 5.0
			InsectSpawnTimeInterval = 1.0
		1.5:
			InsectSpeed = 2.5
			InsectSpawnTimeInterval = 0.5

func move(node, target):	
	var moveTween = node.get_node("MoveTween")
	moveTween.interpolate_property(node, "position", node.position, target, 1.5, Tween.TRANS_ELASTIC, Tween.EASE_OUT)
	moveTween.start()


# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.

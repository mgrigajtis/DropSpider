extends Node2D

# Declare member variables here. Examples:
var Score = 0
var Difficulty = 1.0
var GamePlaying = false

func move(node, target):	
	var moveTween = node.get_node("MoveTween")
	moveTween.interpolate_property(node, "position", node.position, target, 1.5, Tween.TRANS_ELASTIC, Tween.EASE_OUT)
	moveTween.start()


# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.

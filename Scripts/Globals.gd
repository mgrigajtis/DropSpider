extends Node2D

# Declare member variables here. Examples:
var Score = 0
var Difficulty = 1.0
var GamePlaying = false

var minSpawnTime = 0.75
var maxSpawnTime = 1.5

var minSpeed = 6
var maxSpeed = 10

var butterflySprite = preload("res://Scenes/Butterfly.tscn")
var fireflySprite = preload("res://Scenes/Firefly.tscn")
var mosquitoSprite = preload("res://Scenes/Mosquito.tscn")
var ravenSprite = preload("res://Scenes/Raven.tscn")

# Preload the sprites
var Sprites = [butterflySprite,
mosquitoSprite,
mosquitoSprite,
ravenSprite,
fireflySprite,
fireflySprite,
fireflySprite,
mosquitoSprite,
mosquitoSprite,
mosquitoSprite,
ravenSprite]

func set_speed():
	match Difficulty:
		1.0:
			minSpawnTime = 0.75
			maxSpawnTime = 1.5
			minSpeed = 6
			maxSpeed = 10
		1.25:
			minSpawnTime = 0.5
			maxSpawnTime = 1.25
			minSpeed = 3
			maxSpeed = 6
		1.5:
			minSpawnTime = 0.25
			maxSpawnTime = 1.0
			minSpeed = 1
			maxSpeed = 3

func set_difficulty():
	match Difficulty:
		1.0:
			Sprites = [butterflySprite,
mosquitoSprite,
mosquitoSprite,
ravenSprite,
fireflySprite,
fireflySprite,
fireflySprite,
mosquitoSprite,
mosquitoSprite,
mosquitoSprite,
ravenSprite]
		1.25:
			Sprites = [butterflySprite,
mosquitoSprite,
mosquitoSprite,
ravenSprite,
ravenSprite,
ravenSprite,
fireflySprite,
fireflySprite,
fireflySprite,
mosquitoSprite,
mosquitoSprite,
mosquitoSprite,
ravenSprite]
		1.5:
			Sprites = [butterflySprite,
mosquitoSprite,
mosquitoSprite,
ravenSprite,
ravenSprite,
ravenSprite,
ravenSprite,
ravenSprite,
ravenSprite,
fireflySprite,
fireflySprite,
fireflySprite,
mosquitoSprite,
mosquitoSprite,
mosquitoSprite,
ravenSprite]

func reset_values():
	Score = 0
	set_difficulty()
	set_speed()

func move(node, target):	
	var moveTween = node.get_node("MoveTween")
	moveTween.interpolate_property(node, "position", node.position, target, 1.5, Tween.TRANS_ELASTIC, Tween.EASE_OUT)
	moveTween.start()


# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.

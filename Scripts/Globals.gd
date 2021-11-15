extends Node2D

# Declare member variables here. Examples:
var Score = 0
var Difficulty = 1.0
var GamePlaying = false
var SoundOn = true

var minSpawnTime = 0.75
var maxSpawnTime = 1.5

var minSpeed = 3.0
var maxSpeed = 6.0

var butterflySprite = preload("res://Scenes/Butterfly.tscn")
var fireflySprite = preload("res://Scenes/Firefly.tscn")
var mosquitoSprite = preload("res://Scenes/Mosquito.tscn")
var ravenSprite = preload("res://Scenes/Raven.tscn")
var frostBatSprite = preload("res://Scenes/FrostBat.tscn")

# Preload the sprites
var Sprites = [butterflySprite,
mosquitoSprite,
mosquitoSprite,
frostBatSprite,
fireflySprite,
fireflySprite,
fireflySprite,
mosquitoSprite,
mosquitoSprite,
mosquitoSprite,
frostBatSprite]

func play_points_sound():
	if SoundOn:
		get_tree().get_root().get_node("Game/EffectsPlayer").play()

func set_speed():
	match Difficulty:
		1.0:
			minSpawnTime = 0.75
			maxSpawnTime = 1.5
			minSpeed = 3.0
			maxSpeed = 6.0
		1.25:
			minSpawnTime = 0.5
			maxSpawnTime = 1.25
			minSpeed = 2.0
			maxSpeed = 3.0
		1.5:
			minSpawnTime = 0.25
			maxSpawnTime = 0.75
			minSpeed = 1.0
			maxSpeed = 2.0

func set_difficulty():
	match Difficulty:
		1.0:
			Sprites = [butterflySprite,
mosquitoSprite,
mosquitoSprite,
frostBatSprite,
fireflySprite,
fireflySprite,
fireflySprite,
mosquitoSprite,
mosquitoSprite,
mosquitoSprite,
frostBatSprite]
		1.25:
			Sprites = [butterflySprite,
mosquitoSprite,
mosquitoSprite,
frostBatSprite,
frostBatSprite,
frostBatSprite,
fireflySprite,
fireflySprite,
fireflySprite,
mosquitoSprite,
mosquitoSprite,
mosquitoSprite,
frostBatSprite]
		1.5:
			Sprites = [butterflySprite,
mosquitoSprite,
mosquitoSprite,
frostBatSprite,
frostBatSprite,
frostBatSprite,
frostBatSprite,
frostBatSprite,
frostBatSprite,
fireflySprite,
fireflySprite,
fireflySprite,
mosquitoSprite,
mosquitoSprite,
mosquitoSprite,
frostBatSprite]

func reset_values():
	Score = 0
	set_difficulty()
	set_speed()

func move(node, target):	
	var moveTween = node.get_node("MoveTween")
	moveTween.interpolate_property(node, "position", node.position, target, 1.5, Tween.TRANS_ELASTIC, Tween.EASE_OUT)
	moveTween.start()

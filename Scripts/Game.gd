extends Node2D

onready var globals = Globals

var Sprites = [preload("res://Scenes/Butterfly.tscn"),
preload("res://Scenes/Butterfly.tscn"),
preload("res://Scenes/Butterfly.tscn"),
preload("res://Scenes/Raven.tscn")]

var rng = RandomNumberGenerator.new()
onready var Spider = get_node("Spider")

func spawn_sprite():
	rng.randomize()
	var randomNumber = rng.randf_range(0, Sprites.size())
	var sprite = Sprites[randomNumber].instance()
	var randomYNumber = rng.randf_range(250, 500)
	
	sprite.position = Vector2(-250, randomYNumber)
	
	add_child(sprite)
	
	var moveTween = sprite.get_node("Area2D/MoveTween")
	moveTween.interpolate_property(sprite, "position", sprite.position, Vector2(2048, randomYNumber), 10, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	moveTween.start()

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_Timer_timeout():
	if globals.GamePlaying:
		spawn_sprite()
	$Timer.start()

func _on_TouchScreenButton_pressed():
	if globals.GamePlaying:
		Spider.get_node("Area2D/MoveTween").interpolate_property(Spider, "position", Spider.position, Vector2(Spider.position.x, 510), 2.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
		Spider.get_node("Area2D/MoveTween").start()

func _on_TouchScreenButton_released():
	if globals.GamePlaying:
		Spider.get_node("Area2D/MoveTween").interpolate_property(Spider, "position", Spider.position, Vector2(Spider.position.x, 114), 2.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
		Spider.get_node("Area2D/MoveTween").start()

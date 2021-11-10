extends Node2D

# Load the gloabl variables
onready var globals = Globals

# Load the Spider Node
onready var Spider = get_node("Spider")

# Preload the sprites
var Sprites = [preload("res://Scenes/Butterfly.tscn"),
preload("res://Scenes/Butterfly.tscn"),
preload("res://Scenes/Butterfly.tscn"),
preload("res://Scenes/Raven.tscn")]

# Create a random number generator
var rng = RandomNumberGenerator.new()

func spawn_sprite():
	rng.randomize()
	var randomNumber = rng.randf_range(0, Sprites.size())
	var sprite = Sprites[randomNumber].instance()
	var randomYNumber = rng.randf_range(250, 500)
	
	sprite.position = Vector2(-250, randomYNumber)
	
	add_child(sprite)
	
	var moveTween = sprite.get_node("Area2D/MoveTween")
	moveTween.interpolate_property(sprite, "position", sprite.position, Vector2(2048, randomYNumber), globals.InsectSpeed, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	moveTween.start()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if globals.GamePlaying:
		if Spider.get_node("Area2D/AnimationPlayer").current_animation == "Walk":
			if Spider.position == Vector2(596, 114):
				Spider.get_node("Area2D/AnimationPlayer").stop(true)

func _on_Timer_timeout():
	if globals.GamePlaying:
		spawn_sprite()
	
	if $Timer.wait_time > 0.25:
		$Timer.wait_time = $Timer.wait_time - 0.025
		
	$Timer.start()

func _on_TouchScreenButton_pressed():
	if globals.GamePlaying:
		Spider.get_node("Area2D/MoveTween").stop_all()
		Spider.get_node("Area2D/MoveTween").interpolate_property(Spider, "position", Spider.position, Vector2(Spider.position.x, 510), 2.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
		Spider.get_node("Area2D/MoveTween").start()
		
		if Spider.get_node("Area2D/AnimationPlayer").current_animation != "Walk":
			Spider.get_node("Area2D/AnimationPlayer").play ("Walk", -1, 1.0, true)

func _on_TouchScreenButton_released():
	if globals.GamePlaying:
		Spider.get_node("Area2D/MoveTween").stop_all()
		Spider.get_node("Area2D/MoveTween").interpolate_property(Spider, "position", Spider.position, Vector2(Spider.position.x, 114), 2.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
		Spider.get_node("Area2D/MoveTween").start()
		
		if Spider.get_node("Area2D/AnimationPlayer").current_animation != "Walk":
			Spider.get_node("Area2D/AnimationPlayer").play ("Walk", -1, 1.0, true)

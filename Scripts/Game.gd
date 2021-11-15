extends Node2D

# Load the gloabl variables
onready var globals = Globals

# Load the Spider Node
onready var Spider = get_node("Spider")

# Create a random number generator
var rng = RandomNumberGenerator.new()

func spawn_sprite():
	rng.randomize()
	var randomNumber = rng.randi_range(0, globals.Sprites.size() - 1)
	var sprite = globals.Sprites[randomNumber].instance()
	var randomYNumber = rng.randi_range(250, 500)
	var randomSpeed = rng.randf_range(globals.minSpeed, globals.maxSpeed)
	
	sprite.position = Vector2(-250, randomYNumber)
	
	add_child(sprite)
	
	var moveTween = sprite.get_node("Area2D/MoveTween")
	moveTween.interpolate_property(sprite, "position", sprite.position, Vector2(2048, randomYNumber), randomSpeed, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	moveTween.start()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Web.clear_points()
	$Web.add_point(Vector2(596, 114))
	$Web.add_point(Spider.position)
	
	if globals.GamePlaying:
		if Spider.get_node("Area2D/AnimationPlayer").current_animation == "Walk":
			if Spider.position == Vector2(596, 114):
				Spider.get_node("Area2D/AnimationPlayer").stop(true)
			if Spider.position == Vector2(596, 510):
				Spider.get_node("Area2D/AnimationPlayer").stop(true)

func _on_Timer_timeout():
	if globals.GamePlaying:
		spawn_sprite()
	
	rng.randomize()
	var randomNumber = rng.randf_range(globals.minSpawnTime, globals.maxSpawnTime)
	
	$Timer.wait_time = randomNumber
	$Timer.start()

func _on_TouchScreenButton_pressed():
	if globals.GamePlaying:
		Spider.get_node("Area2D/MoveTween").stop_all()
		Spider.get_node("Area2D/MoveTween").interpolate_property(Spider, "position", Spider.position, Vector2(Spider.position.x, 510), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
		Spider.get_node("Area2D/MoveTween").start()
		
		if Spider.get_node("Area2D/AnimationPlayer").current_animation != "Walk":
			Spider.get_node("Area2D/AnimationPlayer").play ("Walk", -1, 1.0, true)

func _on_TouchScreenButton_released():
	if globals.GamePlaying:
		Spider.get_node("Area2D/MoveTween").stop_all()
		Spider.get_node("Area2D/MoveTween").interpolate_property(Spider, "position", Spider.position, Vector2(Spider.position.x, 114), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
		Spider.get_node("Area2D/MoveTween").start()
		
		if Spider.get_node("Area2D/AnimationPlayer").current_animation != "Walk":
			Spider.get_node("Area2D/AnimationPlayer").play ("Walk", -1, 1.0, true)

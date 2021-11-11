extends Node2D

onready var globals = Globals
var ySpeed = 0
var soundEffect = preload("res://SoundEffects/score.ogg")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D/AudioStreamPlayer.stream = soundEffect
	get_node("Area2D/AnimationPlayer").play ("Fly", -1, 1.0, true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	position.y += (ySpeed * globals.Difficulty)

func _on_Area2D_area_entered(area):
	if "areaType" in area:
		if area.areaType == "DestroyLine":
			queue_free()
			
		if area.areaType == "Spider":
			#if !get_tree().get_root().get_node("Game/EffectsPlayer").playing:
			#	get_tree().get_root().get_node("Game/EffectsPlayer").play()
				
			globals.Score += 50
			get_tree().get_root().get_node("Game/UI/Score").text = str(globals.Score)
			
			if globals.Score % 250 == 0:
				globals.InsectSpeed = globals.InsectSpeed - 0.25
			
			queue_free()

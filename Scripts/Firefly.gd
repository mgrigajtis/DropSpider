extends Node2D

onready var globals = Globals
var killPoints = preload("res://Scenes/KillPoints.tscn")
var particleEffect = preload("res://Scenes/FireflyParticleEffect.tscn")

var areaType = "Insect"

# Called when the node enters the scene tree for the first time.
func _ready():
	#$Area2D/AudioStreamPlayer.stream = soundEffect
	get_node("Area2D/AnimationPlayer").play ("Fly", -1, 1.0, true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_Area2D_area_entered(area):
	if "areaType" in area:
		if area.areaType == "DestroyLine":
			queue_free()
			
		if area.areaType == "Spider":
			globals.play_points_sound()
				
			globals.Score += 75
			get_tree().get_root().get_node("Game/UI/Score").text = str(globals.Score)
			
			var kp = killPoints.instance()
			kp.position = Vector2(position)
			get_tree().get_root().get_node("Game").add_child(kp)
			
			kp.set_text("+75")
			kp.play_animation()
			
			var effect = particleEffect.instance()
			effect.position = Vector2(position)
			get_tree().get_root().get_node("Game").add_child(effect)
			effect.play_effect(1)
			
			queue_free()

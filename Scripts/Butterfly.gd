extends Node2D

onready var globals = Globals

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
				
			globals.Score += 100
			get_tree().get_root().get_node("Game/UI/Score").text = str(globals.Score)
			
			queue_free()

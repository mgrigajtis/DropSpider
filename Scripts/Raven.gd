extends Node2D

onready var globals = Globals

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Area2D/AnimationPlayer").play ("Fly", -1, 1.0, true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_area_entered(area):
	if "areaType" in area:
		if area.areaType == "DestroyLine":
			queue_free()

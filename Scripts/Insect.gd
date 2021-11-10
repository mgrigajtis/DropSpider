extends Node2D

onready var globals = Globals
var ySpeed = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.=

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	position.y += (ySpeed * globals.Difficulty)

func _on_Area2D_area_entered(area):
	if area.areaType == "DestroyLine":
		queue_free()

extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func move(target):
	var moveTween = get_node("MoveTween")
	moveTween.interpolate_property(self, "position", position, target, 2, Tween.TRANS_QUINT, Tween.EASE_OUT)
	moveTween.start()


func _on_Start_pressed():
	pass # Replace with function body.

extends Node2D

onready var globals = Globals

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Area2D/AnimationPlayer").play ("Fly", -1, 1.0, true)

func _on_Area2D_area_entered(area):
	if "areaType" in area:
		if area.areaType == "DestroyLine":
			queue_free()
			
		if area.areaType == "Spider":
			globals.GamePlaying = false
			
			globals.reset_values()
			
			get_tree().get_root().get_node("Game/UI/MessageLabel").text = "Game Over!"
			
			# Move the Start Menu to the 0, 0 position
			globals.move(get_tree().get_root().get_node("Game/UI/Menu Buttons/Start"), (Vector2(0, 0)))
			
			# Move the Title to -1024 
			globals.move(get_tree().get_root().get_node("Game/UI/Title"), (Vector2(0, 0)))
			
			var spider = get_tree().get_root().get_node("Game/Spider")
			spider.get_node("Area2D").get_node("MoveTween").interpolate_property(spider, "position", spider.position, Vector2(spider.position.x, 114), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
			get_tree().get_root().get_node("Game/Spider/Area2D/AnimationPlayer").stop(true)

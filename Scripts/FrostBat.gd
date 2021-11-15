extends Node2D

onready var globals = Globals
var frostBat2 = preload("res://Scenes/FrostBat2.tscn")

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
			
			globals.play_bat_sound()
			
			var fb2 = frostBat2.instance()
			fb2.position = Vector2(512, 256)
			get_tree().get_root().get_node("Game").add_child(fb2)
			
			fb2.play_animation(1)
			
			var t = Timer.new()
			t.set_wait_time(1)
			t.set_one_shot(true)
			get_tree().get_root().get_node("Game").add_child(t)
			t.start()
			yield(t, "timeout")
			
			t.queue_free()
			
			# Move the Start Menu to the 0, 0 position
			globals.move(get_tree().get_root().get_node("Game/UI/Menu Buttons/Start"), (Vector2(0, 0)))
			
			# Move the Title to -1024 
			globals.move(get_tree().get_root().get_node("Game/UI/Title"), (Vector2(0, 0)))
			
			var spider = get_tree().get_root().get_node("Game/Spider")
			spider.get_node("Area2D").get_node("MoveTween").interpolate_property(spider, "position", spider.position, Vector2(spider.position.x, 114), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
			get_tree().get_root().get_node("Game/Spider/Area2D/AnimationPlayer").stop(true)

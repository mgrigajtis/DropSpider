extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Start_pressed():
	# Move the Start Menu 1024 pixels to the left
	Globals.move(get_node("Start"), (Vector2(-1024, 0)))

func _on_Settings_pressed():
	# Move the Start Menu 1024 pixels to the left
	Globals.move(get_node("Start"), (Vector2(-1024, 0)))
	
	# Move the Difficulty Menu 768 pixes to the left
	Globals.move(get_node("Difficulty"), (Vector2(-768, 0)))

func _on_Quit_pressed():
	get_tree().quit()

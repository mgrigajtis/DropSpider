extends Node2D

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.

func check_difficulty_button():
	var difficultyMenu = get_node("Difficulty").get_node("DifficultyMenu")
	
	match Globals.Difficulty:
		1.0:
			difficultyMenu.get_node("Easy").text = "*️ Easy"
			difficultyMenu.get_node("Medium").text = "Medium"
			difficultyMenu.get_node("Hard").text = "Hard"
		1.25:
			difficultyMenu.get_node("Easy").text = "️Easy"
			difficultyMenu.get_node("Medium").text = "* Medium"
			difficultyMenu.get_node("Hard").text = "Hard"
		1.5:
			difficultyMenu.get_node("Easy").text = "️Easy"
			difficultyMenu.get_node("Medium").text = "Medium"
			difficultyMenu.get_node("Hard").text = "* Hard"

func _on_Start_pressed():
	# Move the Start Menu 1024 pixels to the left
	Globals.move(get_node("Start"), (Vector2(-1024, 0)))

func _on_Settings_pressed():
	# Move the Start Menu 1024 pixels to the left
	Globals.move(get_node("Start"), (Vector2(-1024, 0)))
	
	# Move the Difficulty Menu 768 pixes to the left
	Globals.move(get_node("Difficulty"), (Vector2(-768, 0)))
	
	check_difficulty_button()

func _on_Back_pressed():
	# Move the Difficulty Menu 768 pixes to the right
	Globals.move(get_node("Difficulty"), (Vector2(1024, 0)))
	
	# Move the Start Menu 1024 pixels to the right
	Globals.move(get_node("Start"), (Vector2(0, 0)))

func _on_Easy_pressed():
	Globals.Difficulty = 1.0
	check_difficulty_button()

func _on_Medium_pressed():
	Globals.Difficulty = 1.25
	check_difficulty_button()
	
func _on_Hard_pressed():
	Globals.Difficulty = 1.5
	check_difficulty_button()

func _on_Quit_pressed():
	get_tree().quit()

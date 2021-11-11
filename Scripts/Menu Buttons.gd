extends Node2D

onready var globals = Globals
var soundImage = preload("res://Images/Sound.png")
var noSoundImage = preload("res://Images/NoSound.png")

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.

func check_difficulty_button():
	var difficultyMenu = get_node("Difficulty").get_node("DifficultyMenu")
	
	match globals.Difficulty:
		1.0:
			difficultyMenu.get_node("Easy").text = "*️ Easy"
			difficultyMenu.get_node("Medium").text = "Medium"
			difficultyMenu.get_node("Hard").text = "Hard"
			globals.InsectSpeed = 10.0
			globals.InsectSpawnTimeInterval = 2.0
		1.25:
			difficultyMenu.get_node("Easy").text = "️Easy"
			difficultyMenu.get_node("Medium").text = "* Medium"
			difficultyMenu.get_node("Hard").text = "Hard"
			globals.InsectSpeed = 5.0
			globals.InsectSpawnTimeInterval = 1.0
		1.5:
			difficultyMenu.get_node("Easy").text = "️Easy"
			difficultyMenu.get_node("Medium").text = "Medium"
			difficultyMenu.get_node("Hard").text = "* Hard"
			globals.InsectSpeed = 2.5
			globals.InsectSpawnTimeInterval = 0.5

func _on_Start_pressed():
	# Move the Start Menu to -1024
	globals.move(get_node("Start"), (Vector2(-1024, 0)))
	
	# Move the Title to -1024 
	globals.move(get_tree().get_root().get_node("Game/UI/Title"), (Vector2(-1024, 0)))
	
	globals.GamePlaying = true
	
	get_tree().get_root().get_node("Game/Timer").wait_time = globals.InsectSpawnTimeInterval
	get_tree().get_root().get_node("Game/Timer").start()
	
	get_tree().get_root().get_node("Game/UI/MessageLabel").text = ""
	get_tree().get_root().get_node("Game/UI/Score").text = str(globals.Score)

func _on_Settings_pressed():
	# Move the Start Menu 1024 pixels to the left
	globals.move(get_node("Start"), (Vector2(-1024, 0)))
	
	# Move the Difficulty Menu 768 pixes to the left
	globals.move(get_node("Difficulty"), (Vector2(-768, 0)))
	
	check_difficulty_button()

func _on_Back_pressed():
	# Move the Difficulty Menu 768 pixes to the right
	globals.move(get_node("Difficulty"), (Vector2(768, 0)))
	
	# Move the Start Menu to the 0, 0 position
	globals.move(get_node("Start"), (Vector2(0, 0)))

func _on_Easy_pressed():
	globals.Difficulty = 1.0
	check_difficulty_button()

func _on_Medium_pressed():
	globals.Difficulty = 1.25
	check_difficulty_button()
	
func _on_Hard_pressed():
	globals.Difficulty = 1.5
	check_difficulty_button()

func _on_Quit_pressed():
	get_tree().quit()


func _on_AudioToggle_pressed():
	if get_tree().get_root().get_node("Game/MusicPlayer").playing:
		get_tree().get_root().get_node("Game/MusicPlayer").stop()
		$AudioToggle.icon = noSoundImage
	else:
		get_tree().get_root().get_node("Game/MusicPlayer").play()
		$AudioToggle.icon = soundImage

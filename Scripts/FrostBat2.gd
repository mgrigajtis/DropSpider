extends Node2D

signal animation_finished

func play_animation():
	$AnimationPlayer.play("JumpScare")
	yield($AnimationPlayer, "animation_finished")
	
	queue_free()

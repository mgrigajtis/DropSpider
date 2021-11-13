extends Node2D

var pointsText = ""

func set_text(pointsText):
	$RichTextLabel.text = pointsText
	$RichTextLabel2.text = pointsText

func play_animation():
	$AnimationPlayer.play("ScaleUp")
	yield($AnimationPlayer, "animation_finished")
	queue_free()

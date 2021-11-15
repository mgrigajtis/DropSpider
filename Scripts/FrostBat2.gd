extends Node2D

func play_animation(seconds):
	$AnimationPlayer.play("JumpScare")
	
	var t = Timer.new()
	t.set_wait_time(seconds)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	
	t.queue_free()
	queue_free()

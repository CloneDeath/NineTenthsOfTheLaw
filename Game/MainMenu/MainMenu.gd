extends Node2D

var selected = 0;

func _process(delta):
	var UP = Input.is_action_just_pressed("ui_up");
	var DOWN = Input.is_action_just_pressed("ui_down");
	if (UP || DOWN):
		selected = (selected + 1) % 2;

	match (selected):
		0:
			$Options/Animation.play("Start");
		1:
			$Options/Animation.play("Controls");
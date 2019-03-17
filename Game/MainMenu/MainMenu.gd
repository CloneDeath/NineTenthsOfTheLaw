extends Node2D

var selected = 0;

func _process(_delta):
	if ($Selection.is_playing()): return;

	var UP = Input.is_action_just_pressed("ui_up");
	var DOWN = Input.is_action_just_pressed("ui_down");
	var ACCEPT = Input.is_action_just_pressed("ui_accept");
	if (UP || DOWN):
		selected = (selected + 1) % 2;

	if (ACCEPT):
		match(selected):
			0:
				$Selection.play("Start");
			1:
				$Selection.play("Controls");
		return;

	match (selected):
		0:
			$Options/Animation.play("Start");
		1:
			$Options/Animation.play("Controls");

func go_to_game():
	#warning-ignore:return_value_discarded
	get_tree().change_scene("res://Game/Prototype/Prototype.tscn");

func go_to_controls():
	#warning-ignore:return_value_discarded
	get_tree().change_scene("res://Game/MainMenu/Controls/Controls.tscn");
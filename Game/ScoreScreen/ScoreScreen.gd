extends Node2D

func _process(_delta):
	var ACCEPT = Input.is_action_just_pressed("ui_accept");

	if (ACCEPT):
		get_tree().change_scene("res://Game/MainMenu/MainMenu.tscn");

func _ready():
	$ScoreValue.set_text(str(GameState.score))
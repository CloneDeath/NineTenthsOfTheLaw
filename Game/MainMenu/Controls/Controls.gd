extends Node2D

func _input(event):
	if (event.is_pressed()):
		#warning-ignore:return_value_discarded
		get_tree().change_scene("res://Game/Prototype/Prototype.tscn");
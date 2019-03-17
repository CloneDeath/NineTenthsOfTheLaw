extends Node2D

func _input(event):
	if (event.is_pressed()):
		get_tree().set_input_as_handled()
		#warning-ignore:return_value_discarded
		get_tree().change_scene("res://Game/Prototype/Prototype.tscn");
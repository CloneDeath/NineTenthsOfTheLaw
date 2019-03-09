extends Node

var body
var player
var HEARING_RANGE = 50;
var SEEING_RANGE = 100;

func setup(entity):
	body = entity;
	set_player()

func _physics_process(delta):
	make_decision()

func set_player():
	if player == null:
		player = get_tree().get_root().get_node("/root/Level/Player")
		
		

func make_decision():
	set_player()
	if player == null:
		return
	if (can_see_player()):
		pass
	elif can_hear_player():
		turn_toward_player();
	else:
		body.input.set_state(body.input.IDLE)

func can_see_player():
	return is_player_in_front() and distance_to_player() < SEEING_RANGE;
	
func can_hear_player():
	var player_in_front = is_player_in_front()
	var distance = distance_to_player()
	if (distance_to_player() < 100):
		pass
	return !is_player_in_front() and distance_to_player() < HEARING_RANGE;
	
func is_player_in_front():
	return player.position.x - body.position.x > 0 and body.facing > 0

func distance_to_player():
	return abs(player.position.x - body.position.x)
	
func turn_toward_player():
	if (player.position.x - body.position.x > 0):
		body.facing = 1
	elif (player.position.x - body.position.x < 0):
		body.facing = -1

func act_on_player():
	pass

func get_direction():
	return body.facing;
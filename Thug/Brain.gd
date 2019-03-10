extends Node

var body
var can_see_player = false
var can_attack = false
var can_hear_player = false
var PLAYER_NAME = "Player"
var player
var default_state

func setup(entity):
	body = entity;
	default_state = body.starting_state

func _physics_process(_delta):
	make_decision()

func make_decision():
	if (can_hear_player):
		turn_toward_player()
	elif (can_attack):
		body.input.set_state(body.input.ATTACK)
	elif (can_see_player):
		if body.facing == 1:
			body.input.set_state(body.input.RIGHT)
		else:
			body.input.set_state(body.input.LEFT)
	else:
		body.input.set_state(default_state)

func turn_toward_player():
	if (player.position.x - body.position.x > 0):
		body.facing = 1
	elif (player.position.x - body.position.x < 0):
		body.facing = -1



# Sensory Connections:

func _on_HearingDetector_body_entered(body):
	if body.name == PLAYER_NAME:
		player = body
		turn_toward_player()
		can_hear_player = true

func _on_HearingDetector_body_exited(body):
	if body.name == PLAYER_NAME:
		player = body
		can_hear_player = false

func _on_VisionDetector_body_entered(body):
	if body.name == PLAYER_NAME:
		player = body
		can_see_player = true;

func _on_VisionDetector_body_exited(body):
	if body.name == PLAYER_NAME:
		player = body
		can_see_player = false;

func _on_AttackRangeDetector_body_entered(body):
	if body.name == PLAYER_NAME:
		can_attack = true;


func _on_AttackRangeDetector_body_exited(body):
	if body.name == PLAYER_NAME:
		can_attack = false;



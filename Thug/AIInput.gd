extends Node

class_name AIInput

var LEFT = 0
var RIGHT = 1
var CROUCH = 2
var SIT = 3
var JUMP = 4
var ATTACK = 5
var IDLE = 6

var State = SIT
func set_state(state): State = state;


#warning-ignore:unused_class_variable
var Left setget ,get_left;
func get_left(): return State == LEFT;

#warning-ignore:unused_class_variable
var Right setget ,get_right;
func get_right(): return State == RIGHT;

#warning-ignore:unused_class_variable
var Crouch setget ,get_crouch;
func get_crouch(): return State == CROUCH;

#warning-ignore:unused_class_variable
var Sit setget ,get_sit;
func get_sit(): return State == SIT;

#warning-ignore:unused_class_variable
var Fall setget ,get_fall;
func get_fall(): return State != get_jump();

#warning-ignore:unused_class_variable
var Attack setget ,get_attack;
func get_attack(): return State == ATTACK;

#warning-ignore:unused_class_variable
var _jump_time = 0.0;
var _jump_threshold = 0.1;
var Jump setget ,get_jump;
func get_jump(): return State == JUMP && _jump_time < _jump_threshold;

func update(delta):
	if (State == JUMP):
		self._jump_time += delta;
	else:
		self._jump_time = 0;
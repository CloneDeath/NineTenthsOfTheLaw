extends State

var turnaround_timer = 0.5;
var give_up_timer = 3.0;

func on_enter(entity):
	give_up_timer = 3.0;
	turnaround_timer = 0.5;
	entity.has_weapon = true;

func update(entity, delta):
	give_up_timer -= delta;
	turnaround_timer -= delta;
	if (turnaround_timer <= 0):
		turnaround_timer = 0.5;
		entity.facing *= -1;
	entity.velocity.x = 0;
	entity.set_animation("Idle");

func get_next_state(entity):
	if (entity.can_attack_player()):
		return "Attack";
	if (entity.can_see_player()):
		return "Persue";
	if (give_up_timer <= 0):
		return "Smoking";
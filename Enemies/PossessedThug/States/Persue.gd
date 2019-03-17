extends State

var run_speed = 18;

func update(entity, _delta):
	var player = entity.get_player();
	entity.facing = 1 if entity.global_position < player.global_position else -1;
	entity.velocity.x = entity.facing * run_speed;
	entity.set_animation("Idle");

func get_next_state(entity):
	if (!entity.can_see_player()):
		return "Alert";
	return null;
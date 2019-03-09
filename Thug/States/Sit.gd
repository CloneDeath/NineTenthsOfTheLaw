extends State

func on_enter(player):
	player.set_animation("Sit");
	player.velocity.x = 0;

func update(player, _delta):
	var input = player.input;
	if (input.Jump):
		player.allow_fall_through(true);

func get_next_state(enemy):
	var input = enemy.input;
	if (!enemy.is_on_floor()):
		return "InAir";
	if (!input.Sit):
		return "Crouch";
	return null;
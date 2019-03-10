extends State

func on_enter(player):
	player.set_animation("Attack");
	player.velocity.x = 0;

func get_next_state(player):
	if (!player.animation_is_playing()):
		return "Aim";
	return null;
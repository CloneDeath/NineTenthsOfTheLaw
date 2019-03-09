extends State

func on_enter(player):
	player.set_animation("Jump");
	player.velocity.x = 0;

func get_next_state(player):
	if (!player.animation_is_playing()):
		return "InAir";
	return null;
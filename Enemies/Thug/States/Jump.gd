extends State

func on_enter(entity):
	entity.set_animation("Jump");
	entity.velocity.x = 0;

func get_next_state(entity):
	if (!entity.animation_is_playing()):
		return "InAir";
	return null;
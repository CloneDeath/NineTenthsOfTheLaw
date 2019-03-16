extends State

func on_enter(entity):
	entity.set_animation("Attack");
	entity.velocity.x = 0;


func get_next_state(entity):
	if (!entity.animation_is_playing()):
		return "Alert";
	return null;
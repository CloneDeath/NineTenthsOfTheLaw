extends State

func on_enter(entity):
	entity.set_animation("Aim");
	entity.velocity.x = 0;

func get_next_state(entity):
	var input = entity.input;
	if (!entity.is_on_floor()):
		return "InAir";
	if (input.Attack):
		return "Attack";
	if (input.Aim):
		return "Idle";
	return null;
extends State

func update(entity, _delta):
	entity.velocity.x = 0;
	entity.set_animation("Idle");
	entity.update_facing();

func get_next_state(entity):
	var input = entity.input;
	if (!entity.is_on_floor()):
		return "InAir";
	if (input.Crouch || input.Sit):
		return "Crouch";
	if (input.Left || input.Right):
		return "Run";
	if (input.Jump):
		return "Jump";
	if (input.Attack):
		return "Attack";
	return null;
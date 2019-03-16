extends State

func on_enter(entity):
	entity.set_animation("Sit");
	entity.velocity.x = 0;

func update(entity, _delta):
	var input = entity.input;
	if (input.Jump):
		entity.allow_fall_through(true);
	entity.update_facing();

func get_next_state(entity):
	var input = entity.input;
	if (!entity.is_on_floor()):
		return "InAir";
	if (!input.Sit):
		return "Crouch";
	return null;
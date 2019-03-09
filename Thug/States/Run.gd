extends State

const run_speed = 48;

func update(entity, _delta):
	var input = entity.input;
	var velocity = (int(input.Right)-int(input.Left));
	entity.velocity.x = velocity * run_speed;
	entity.set_animation("Run");
	entity.update_facing();

func get_next_state(entity):
	var input = entity.input;
	if (!entity.is_on_floor()):
		return "InAir";
	if (input.Crouch):
		return "Crouch";
	if (!input.Left && !input.Right):
		return "Idle";
	if (input.Jump):
		return "Jump";
	if (input.Attack):
		return "Attack";
	return null;

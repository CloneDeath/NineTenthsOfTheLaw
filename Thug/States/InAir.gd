extends State

const run_speed = 48;

func update(entity, _delta):
	var input = entity.input;
	var vert_vel = entity.velocity.y;
	if (vert_vel < 0 && vert_vel > -150 && input.Fall):
		entity.velocity.y = 0;
	var velocity = (int(input.Right)-int(input.Left));
	entity.velocity.x = velocity * run_speed;
	entity.set_animation("InAir");
	if (!input.Crouch):
		entity.allow_fall_through(false);
	entity.update_facing();

func get_next_state(entity):
	var input = entity.input;
	if (entity.is_on_floor()):
		if (input.Crouch):
			return "Crouch";
		return "Idle";
	if (input.Attack):
		return "Attack";
	return null;
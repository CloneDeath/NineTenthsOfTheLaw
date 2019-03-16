extends State

var aim_angle = 90;

func on_enter(entity):
	entity.set_animation("Aim");
	entity.velocity.x = 0;
	aim_angle = 90;

func update(entity, delta):
	aim_angle = max(aim_angle * pow(0.1, delta), 1);
	entity.set_aim_angle(aim_angle);
	entity.update_facing();

func on_exit(entity):
	entity.disable_aim();

func get_next_state(entity):
	var input = entity.input;
	if (!entity.is_on_floor()):
		return "InAir";
	if (input.Attack):
		return "Attack";
	if (input.Aim):
		return "Idle";
	return null;
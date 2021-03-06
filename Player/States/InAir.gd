extends State

const run_speed = 24;

func update(player, _delta):
	var input = player.input;
	var vert_vel = player.velocity.y;
	if (vert_vel < 0 && vert_vel > -150 && input.Fall):
		player.velocity.y = 0;
	var velocity = (int(input.Right)-int(input.Left));
	player.velocity.x = velocity * run_speed;
	player.set_animation("InAir");
	if (!input.Crouch):
		player.allow_fall_through(false);
	player.update_facing();

func get_next_state(player):
	var input = player.input;
	if (player.is_on_floor()):
		if (input.Crouch):
			return "Crouch";
		return "Idle";
	return null;
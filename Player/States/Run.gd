extends State

const run_speed = 36;

func update(player, _delta):
	var input = player.input;
	var velocity = (int(input.Right)-int(input.Left));
	player.velocity.x = velocity * run_speed;
	player.set_animation("Run");
	player.update_facing();

func get_next_state(player):
	var input = player.input;
	if (!player.is_on_floor()):
		return "InAir";
	if (input.Crouch):
		return "Crouch";
	if (!input.Left && !input.Right):
		return "Idle";
	if (input.Jump):
		return "Jump";
	if (input.Aim):
		return "Aim";
	return null;

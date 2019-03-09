extends State

const run_speed = 48;

func on_enter(player):
	player.set_animation("Attack");
	player.velocity.x = 0;

func update(player, _delta):
	if (player.is_on_floor()):
		player.velocity.x = 0;
	else:
		var input = player.input;
		var velocity = int(input.Right) - int(input.Left);
		player.velocity.x = velocity * run_speed;

func get_next_state(player):
	var animation = player.get_node("Animation") as AnimationPlayer;
	if (!animation.is_playing()):
		return "Idle";
	return .get_next_state(player);
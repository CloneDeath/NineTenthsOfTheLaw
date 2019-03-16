extends State

const run_speed = 48;

func on_enter(entity):
	entity.set_animation("Attack");
	entity.velocity.x = 0;

func update(entity, _delta):
	if (entity.is_on_floor()):
		entity.velocity.x = 0;
	else:
		var input = entity.input;
		var velocity = int(input.Right) - int(input.Left);
		entity.velocity.x = velocity * run_speed;

func get_next_state(entity):
	var animation = entity.get_node("Animation") as AnimationPlayer;
	if (!animation.is_playing()):
		return "Idle";
	return .get_next_state(entity);
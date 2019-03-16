extends State

func update(entity, _delta):
	entity.set_animation("Smoking");

func get_next_state(entity):
	if (entity.can_see_player()):
		return "Persue";
extends State

var damage_time = 0;

func on_enter(entity):
	damage_time = 0.2;
	if (entity.has_weapon):
		entity.set_animation("Damaged (Weapon)");
	else:
		entity.set_animation("Damaged (No Weapon)");
	entity.velocity.x = 0;

func update(_entity, delta):
	damage_time -= delta;

func get_next_state(_entity):
	if (damage_time <= 0):
		return "Alert";

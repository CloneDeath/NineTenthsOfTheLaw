extends Humanoid

export(int, -1, 1, 2) var facing = 1;
var health = 5;
#warning-ignore:unused_class_variable
var has_weapon = false;

func _physics_process(delta):
	update_physics(delta);
	update_facing();

func allow_fall_through(mode):
	set_collision_mask_bit(1, !mode);
	$GroundDetector.set_collision_mask_bit(1, !mode);

func is_on_floor():
	return $GroundDetector.get_overlapping_bodies().size() > 0;

func set_animation(animation):
	if ($Animation.current_animation == animation): return;
	$Animation.play(animation);

func animation_is_playing():
	return $Animation.is_playing();

func update_facing():
	$Sprite.scale.x = facing;

func damage_player():
	var player = get_player();
	if (player):
		player.damage();

func damage():
	$StateMachine.transition_to_state("Damaged");
	health -= 1;
	if (health <= 0):
		self.queue_free();

func can_see_player():
	return !$Sprite/Detectors/VisionDetector.get_overlapping_bodies().empty();

func can_attack_player():
	return !$Sprite/Detectors/AttackRangeDetector.get_overlapping_bodies().empty();

func get_player():
	return get_tree().get_nodes_in_group("player")[0];
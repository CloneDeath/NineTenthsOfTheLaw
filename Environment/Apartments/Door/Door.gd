extends Node2D

func _process(_delta):
	move_detector();
	update_visuals();

func get_open_amount():
	return clamp($PlayerDetector.position.x - 4, -18, 18);

func update_visuals():
	$Door.scale.x = get_open_amount() / 18.0;

func move_detector():
	if (player_found()):
		update_detector();
	var open_amount = get_open_amount();
	if (abs(open_amount) == 1):
		$PlayerDetector.collision_mask = 0;

func player_found():
	return !$PlayerDetector.get_overlapping_bodies().empty();

func update_detector():
	var player = $PlayerDetector.get_overlapping_bodies()[0];
	var px = player.global_position.x;
	var dx = $PlayerDetector.global_position.x - px;
	if (sign(dx) != player.facing): return;
	$PlayerDetector.global_position.x = px + sign(dx) * 7;
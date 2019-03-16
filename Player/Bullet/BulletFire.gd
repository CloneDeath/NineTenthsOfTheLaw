extends Node2D

var disable = false;

func _physics_process(_delta):
	if (disable): return;
	var results = $EnemyDetector.get_overlapping_bodies();
	var closest = null;
	for body in results:
		if (closest == null):
			closest = body;
			continue;
		var nearest_dist = global_position.distance_to(closest.position);
		var body_dist = global_position.distance_to(body.position);
		if (body_dist < nearest_dist):
			closest = body;

	if (closest != null):
		$BulletStream.visible = true;
		disable = true;
		$BulletStream.points[1].x = global_position.distance_to(closest.global_position) - 8;
		if (closest.has_method("damage")):
				closest.damage();
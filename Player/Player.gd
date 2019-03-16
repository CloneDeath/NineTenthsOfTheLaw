extends Humanoid

var jump_speed = 175;
var facing = 1;

var input = PlayerInput.new();

var bullet_scene = load("res://Player/Bullet/BulletFire.tscn");

func _ready():
	disable_aim();

func set_aim_angle(angle):
	$Sprite/Arc.visible = true;
	$Sprite/Arc.ArcAngle = angle;
	$Sprite/Arc.modulate.a = lerp(0.05, 0, angle/90);

func disable_aim():
	$Sprite/Arc.visible = false;

func _physics_process(delta):
	input.update(delta);
	update_physics(delta);

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
	if (input.Left != input.Right):
		facing = 1 if input.Right else -1;
	$Sprite.scale.x = facing;

func do_jump():
	velocity.y = -jump_speed;

func do_attack():
	var aim_angle = $Sprite/Arc.ArcAngle;
	var angle = rand_range(-aim_angle/2, aim_angle/2);
	var bullet = bullet_scene.instance();
	bullet.position.y = -3.5;
	bullet.position.x += 8;
	bullet.rotation = deg2rad(angle);
	$Sprite.add_child(bullet);
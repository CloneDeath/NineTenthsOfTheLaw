extends Humanoid

var jump_speed = 175;
var facing = 1;
var health = 3;

var input = AIInput.new();
export(int) var starting_direction = 1;
export(bool) var is_seated = false;

func _ready():
	if (is_seated):
		input.State = input.SIT
	else:
		input.State = input.IDLE
	facing = starting_direction
	$Brain.setup(self);

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
	$Sprite.scale.x = facing;
	$HearingDetector.scale.x = facing;
	$VisionDetector.scale.x = facing;
	$AttackRangeDetector.scale.x = facing;

func do_jump():
	velocity.y = -jump_speed;

func damage():
	$StateMachine.transition_to_state("Damaged");
	health -= 1;
	if (health <= 0):
		self.queue_free();
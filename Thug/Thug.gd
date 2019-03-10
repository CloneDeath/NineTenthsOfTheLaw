extends KinematicBody2D

var velocity = Vector2(0, 0);
var jump_speed = 175;
var up_gravity = 400;
var down_gravity = 200;
var facing = 1;
var health = 3;

var input = AIInput.new();
onready var brain = get_node("Brain")
export(int) var starting_direction = 1;
export(int) var starting_state = 6;

func _ready():
	input.State = starting_state
	facing = starting_direction
	brain.setup(self);

func _physics_process(delta):
	input.update(delta);
	update_physics(delta);

func update_physics(delta):
	if (velocity.y < 0):
		velocity.y += up_gravity * delta;
	else:
		velocity.y += down_gravity * delta;
	velocity = self.move_and_slide(velocity, Vector2(0, -1));
	if (is_on_floor()):
		var friction = pow(0.1, delta);
		velocity.x = velocity.x * friction;

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
extends KinematicBody2D
class_name Humanoid

var velocity = Vector2(0, 0);
var up_gravity = 400;
var down_gravity = 200;

func update_physics(delta):
	if (velocity.y < 0):
		velocity.y += up_gravity * delta;
	else:
		velocity.y += down_gravity * delta;
	velocity = self.move_and_slide_with_snap(velocity, Vector2(0, 1), Vector2(0, -1), true, 40);
	if (is_on_floor()):
		var friction = pow(0.1, delta);
		velocity.x = velocity.x * friction;
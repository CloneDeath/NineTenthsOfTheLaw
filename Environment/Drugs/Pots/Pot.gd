extends Node2D

export(int) var plant_type = 0 
var empty_plant = 6

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.frame = plant_type


func _on_Collision_body_entered(body):
	if body.name == "Player":
		$Sprite.frame = empty_plant
		GameState.score += 1


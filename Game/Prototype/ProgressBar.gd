extends ProgressBar

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	set_health();
	
func update():
	set_health();
		
func set_health():
	var player = get_player();
	if player != null:
		value = player.health
	

func get_player():
	return get_tree().get_nodes_in_group("player")[0];
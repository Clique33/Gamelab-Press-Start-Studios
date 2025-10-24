extends Timer

@onready var distance_timer: Timer = $"."
@onready var map: Node2D = $".."

func _on_timeout() -> void:  
	if map.bananas!=map.last_ban:
		distance_timer.wait_time=distance_timer.wait_time**(1/map.bananas)

extends Area2D

@onready var monkey: CharacterBody2D = $"../Monkey"
@onready var map: Node2D = $".."

var charge: bool=true

func _ready() ->void:
	$charge.play("pisca")

func _physics_process(delta: float) -> void:
	if charge==true:
		position.y=monkey.position.y
	else:
		if is_instance_valid(map)==true:
			if map.get_name()=="map":
				var velocity = -750-(5*map.bananas)
				position.x += velocity * delta
			else:
				print("pois é")
		else:
			print("não")

func _on_animations_animation_finished() -> void:
	if $charge.animation== "pisca":
		$charge.play("danger")
	elif $charge.animation == "danger":
		charge=false
		$charge.position = $charge.position + Vector2(300,0)
		$charge.scale+=Vector2(0.07,0.073) 
		$charge.play("default")

func _on_body_entered(body: Node2D) -> void:
	map.game_over()

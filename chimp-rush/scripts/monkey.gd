extends CharacterBody2D

@onready var map: Node2D = $".."

const jump = -200.0
var jumping=0
var alternate: bool=true
var ground: bool=false

func _ready() -> void:
	if Input.is_action_pressed("go_up"):
		$animated.position+=Vector2(0,-200)          
		$animated.play("jumping_1")
	else: 
		$animated.play("idle_air")

func _physics_process(delta: float) -> void:
	#gravity.
	if not is_on_floor():
		velocity += get_gravity()*3/4* delta
		if ground==true:
			$animated.position+=Vector2(0,-20)
			$animated.position+=Vector2(0,200) 
			$animated.play("transition_3")
			$animated.position+=Vector2(0,-30)

			ground=false
	else:
		if ground==false:
			$animated.position+=Vector2(0,20)
			$animated.play("transition_3")
			$animated.position+=Vector2(0,30)
			
			ground=true
	#Jump system.
	if Input.is_action_just_released("go_up"):
		if $animated.get_animation()!="transition_3":
			$animated.position+=Vector2(0,200)
		$animated.play("idle_air")
		jumping=0
	else:
		if Input.is_action_just_pressed("go_up"):
			if alternate==true: 
				alternate=false
				$animated.position+=Vector2(0,-200)
				$animated.play("jumping_2") 
			else: 
				alternate=true
				$animated.position+=Vector2(0,-200)
				$animated.play("jumping_1")
		if Input.is_action_pressed("go_up"):
			jumping-=3
			velocity.y = jump + jumping

	move_and_slide()

func collected() -> void:
	map.coleta_bananas()


func _on_animated_animation_finished() -> void:
	if $animated.animation =="jumping_1":
		$animated.play("jumping_2")
	elif $animated.animation=="jumping_2":
		$animated.play("jumping_1")
	elif $animated.animation =="transition_3":
		if ground==true: 
			$animated.play("walking")
		else: 
			$animated.position+=Vector2(0,-200) 
			$animated.play("jumping_1")

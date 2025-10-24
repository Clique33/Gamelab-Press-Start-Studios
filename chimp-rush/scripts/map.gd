extends Node2D

func _ready() -> void:
	game_new()

func game_new() -> void:
	$DistanceTimer.start()
	$ObstacleTimer.start()
	$BirdTimer1.start()

func game_over() -> void:
	get_tree().reload_current_scene()

#score e banana
@onready var meter_num: Label = $HUD/MeterNum
@onready var banana_num: RichTextLabel = $HUD/Banana_num


var bananas: int = 0
var meter: float = 0
var last_ban: int = 0


func coleta_bananas() -> void:
	bananas += 1
	last_ban=bananas
	banana_num.text= "[color=baba00] 0[/color] [img width=38]res://assets/text/banana chibi.png[/img]" %bananas
	
func _on_distance_timer_timeout() -> void:
	meter+=1
	meter_num.text= "%d m" % meter

#spawns
@export var obstacles: Array[PackedScene] = []
@export var bird: PackedScene
@onready var monkey: CharacterBody2D = $Monkey


var posicoes: Array[Vector2] = [Vector2(1600,490), Vector2(1600,320), Vector2(1600,160)]
var last_pos: Vector2 = Vector2(0,0)
var last_obs: PackedScene = obstacles.pick_random()

func spawn_enemy() -> void:
	#random obstacle
	var pick_obs : PackedScene = obstacles.pick_random()
	while pick_obs == last_obs: pick_obs = obstacles.pick_random()
	last_obs=pick_obs
	var spawnable = pick_obs.instantiate()
	add_child(spawnable)
	
	#random position
	var pick_pos: Vector2 = posicoes.pick_random()
	while pick_pos == last_pos: pick_pos = posicoes.pick_random()
	last_pos = pick_pos 
	spawnable.global_position = pick_pos
	
func spawn_bird()->void:
	var spawnable_bird = bird.instantiate()
	add_child(spawnable_bird)
	spawnable_bird.global_position = Vector2(1380,monkey.position.y)

func _on_obstacle_timer_timeout() -> void:
	spawn_enemy()

func _on_bird_timer_timeout() -> void:
	$BirdTimer2.start()

func _on_bird_timer_2_timeout() -> void:
	spawn_bird()
	

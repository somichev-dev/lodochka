extends Node2D

@export var h_offset = 200
@onready var mine_cluster = preload("res://scenes/mine.tscn")
@onready var pozdnyakoin = preload("res://scenes/quants/pozdyakoin.tscn")
@onready var coin = preload("res://scenes/quants/coin_quant.tscn")

func _ready() -> void:
	var window = randi_range(0, 5)
	position.x = 0
	for i in range(0, 6):
		var spawned_obj = mine_cluster as PackedScene
		if i == window:
			if randi_range(0, 99) >= 98:
				spawned_obj = pozdnyakoin as PackedScene
			else:
				spawned_obj = coin as PackedScene
		spawned_obj = spawned_obj.instantiate()
		spawned_obj.position.x = -490 + (i * h_offset)
		add_child(spawned_obj)
			

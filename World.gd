extends Node2D


func _ready():
	var Level1 = preload("res://Level1.tscn").instance()
	add_child(Level1)

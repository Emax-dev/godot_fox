extends Node2D
@onready var fox: CharacterBody2D = $Fox
@onready var player_cam: Camera2D = $PlayerCam


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _physics_process(delta: float) -> void:
	player_cam.position=fox.position

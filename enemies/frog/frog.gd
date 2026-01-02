extends EnemyBase

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var jumper_timer: Timer = $JumperTimer

const JUMP_VELOCITY:Vector2=Vector2(100,-150)
const JUMP_WAIT_RANGE:Vector2=Vector2(2.5,5.0)
var _jump:bool =false
var _seen_player:bool =false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_timer()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	if is_on_floor()==false:
		velocity.y+=_gravity*delta
	else:
		velocity.x=0
		animated_sprite_2d.play("idle")
	apply_jump()
	move_and_slide()
	flip_me()
func apply_jump()->void:
	pass
func flip_me()->void:
	if(
		_player_ref.global_position.x>global_position.x
		and animated_sprite_2d.flip_h==false):
		animated_sprite_2d.flip_h=true
	elif(_player_ref.global_poisiton.x<global_position.x
		and animated_sprite_2d.flip_h==true):
		animated_sprite_2d.flip_h=false
func start_timer()->void:
	jumper_timer.wait_time=randf_range(JUMP_WAIT_RANGE.x,JUMP_WAIT_RANGE.y)
	jumper_timer.start()
func _on_jumper_timer_timeout() -> void:
	_jump=true # Replace with function body.
func _on_visible_on_screen_enabler_2d_screen_entered() -> void:
	_seen_player=true

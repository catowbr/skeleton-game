extends CharacterBody2D

@export var speed: float = 140.0
@export var can_touch: bool = false
@export var can_open_doors: bool = false

@export var character: CharacterBody2D
@export var tileset: TileSet
@export var tile_map_layer: TileMapLayer

@export var animatedSprite: AnimatedSprite2D

var current_direction: Vector2 = Vector2(1, 0)


func _ready() -> void:
	Connect.skeleton_stop.connect(on_skeleton_stop)
	Connect.skeleton_move_south.connect(move_south)
	Connect.skeleton_move_north.connect(move_north)
	Connect.skeleton_move_east.connect(move_east)
	Connect.skeleton_move_west.connect(move_west)


func _process(delta: float) -> void:
	if is_on_wall() or randi_range(0, 16) == 1:
		var wuff = randi_range(0, 3)
		if wuff == 0:
			move_north()
		if wuff == 1:
			move_south()
		if wuff == 2:
			move_east()
		if wuff == 3:
			move_west()

	var direction = current_direction.normalized()
	velocity = direction * speed

	move_and_slide()

func move_south():
	current_direction = Vector2(0, -1)
	animatedSprite.play("walkDown")

func move_north():
	current_direction = Vector2(0, 1)
	animatedSprite.play("walkUp")

func move_east():
	current_direction = Vector2(1, 0)
	animatedSprite.play("walkRight")

func move_west():
	current_direction = Vector2(-1, 0)
	animatedSprite.play("walkLeft")

func on_skeleton_stop():
	current_direction = Vector2(0, 0)
	animatedSprite.play("default")

func get_decisions_from_tile() -> Array[Decisions.Room_Decisions]:
	var room_decisions = Decisions.Room_Decisions
	var character_position = character.global_position
	var tile_map_data = tile_map_layer.get_cell_tile_data(character_position)
	var decisions: Array[Decisions.Room_Decisions]
	if tile_map_data.get_custom_data("WALK_NORTH"): decisions.append(room_decisions.WALK_NORTH)
	if tile_map_data.get_custom_data("WALK_EAST"): decisions.append(room_decisions.WALK_EAST)
	if tile_map_data.get_custom_data("WALK_SOUTH"): decisions.append(room_decisions.WALK_SOUTH)
	if tile_map_data.get_custom_data("WALK_WEST"): decisions.append(room_decisions.WALK_WEST)
	return decisions

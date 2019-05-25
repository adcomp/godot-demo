extends Node2D

var offset = Vector2(10000, 10000)
var grid_size
var cell_size
var grid_w
var grid_h

func _ready():
	grid_size = $TileMap.grid_size
	cell_size = $TileMap.cell_size
	grid_w = grid_size.x * cell_size.x
	grid_h = grid_size.y * cell_size.y
	
	$Player.set_position(offset)
	$TileMap.generate_world(offset)

func _process(delta):
	var player_x = int($Player.get_position().x)
	var player_y = int($Player.get_position().y)

	$CanvasLayer/pos.set_text("x = " + str(player_x) + " , y = " + str(player_y))

	# centre du chunk actuel
	var x = int(player_x / grid_w) * grid_w + grid_w / 2 
	var y = int(player_y / grid_h) * grid_h + grid_h / 2


	# check à droite
	offset.x = x + grid_w
	offset.y = y
	if $TileMap.get_cellv($TileMap.world_to_map(offset)) == -1:
		$TileMap.generate_world(offset)

	# check à gauche
	offset.x = x - grid_w
	offset.y = y
	if $TileMap.get_cellv($TileMap.world_to_map(offset)) == -1:
		$TileMap.generate_world(offset)
	
	# check au dessus
	offset.x = x
	offset.y = y - grid_h
	if $TileMap.get_cellv($TileMap.world_to_map(offset)) == -1:
		$TileMap.generate_world(offset)

	# check en dessous
	offset.x = x
	offset.y = y + grid_h
	if $TileMap.get_cellv($TileMap.world_to_map(offset)) == -1:
		$TileMap.generate_world(offset)

	# check coin haut gauche
	offset.x = x - grid_w
	offset.y = y - grid_h
	if $TileMap.get_cellv($TileMap.world_to_map(offset)) == -1:
		$TileMap.generate_world(offset)

	# check coin haut droite
	offset.x = x + grid_w
	offset.y = y - grid_h
	if $TileMap.get_cellv($TileMap.world_to_map(offset)) == -1:
		$TileMap.generate_world(offset)

	# check coin bas droite
	offset.x = x + grid_w
	offset.y = y + grid_h
	if $TileMap.get_cellv($TileMap.world_to_map(offset)) == -1:
		$TileMap.generate_world(offset)

	# check coin bas gauche
	offset.x = x - grid_w
	offset.y = y + grid_h
	if $TileMap.get_cellv($TileMap.world_to_map(offset)) == -1:
		$TileMap.generate_world(offset)




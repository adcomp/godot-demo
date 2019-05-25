extends TileMap

var grid_size = Vector2(8, 8)
var open_simplex_noise
var chunk = []

func _ready():
	randomize()
	open_simplex_noise = OpenSimplexNoise.new()
	open_simplex_noise.seed = randi()
	open_simplex_noise.octaves = 4
	open_simplex_noise.period = 15
	open_simplex_noise.lacunarity = 1.5 
	open_simplex_noise.persistence = 0.75

func generate_chunck(offset):

	var o_x = int (offset.x / (cell_size.x * grid_size.x))
	var o_y = int (offset.y / (cell_size.y * grid_size.y))
	var c = Vector2(o_x, o_y)
	
	if c in chunk: # chunk existe déjà ?
		return
	else:
		chunk.append(c) # sinon on l'ajoute
		
	print("generate ", o_x, ", ", o_y)
	var val
	for x in range(o_x * grid_size.x, (o_x + 1) * grid_size.x):
		for y in range(o_y * grid_size.y, (o_y + 1) * grid_size.y):
			val = open_simplex_noise.get_noise_2d(float(x), float(y))
			val = inverse_lerp(-1, 1, val) * 9 # nbr de tile 

			set_cellv(Vector2(x,y), val) 

extends Sprite2D

@export var speed : float = 5.0

@export var action_up : String
@export var action_down : String

var m_dimension

func _ready():
	var size = texture.get_size()
	m_dimension = Vector2(size.x * scale.x, size.y * scale.y)

func SetPosition(p):
	position = p

func _process(delta):
	if (Input.is_action_pressed(action_down)):
		position.y += speed
	else:
		if (Input.is_action_pressed(action_up)):
			position.y -= speed

func GetDimension():
	return m_dimension

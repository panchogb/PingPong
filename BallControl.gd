extends Sprite2D

@export var e_speed : float = 4

var m_velocity : Vector2
var m_sizeScreen : Vector2

var m_dimension : Vector2

var m_player1 : Node2D
var m_player2 : Node2D

var f_endPoint

func _ready():
	m_velocity = Vector2(1,-1)
	m_sizeScreen = get_viewport_rect().size
	
	var size = texture.get_size()
	m_dimension = Vector2(size.x * scale.x, size.y * scale.y)
	
	position = get_viewport_rect().size / 2
	
func Init(endPoint, player1, player2):
	f_endPoint = endPoint
	
	m_player1 = player1
	m_player2 = player2

func Start(dir):
	position = get_viewport_rect().size / 2
	m_velocity.x = dir	

func _process(delta):
	position += m_velocity * e_speed
	
	if (position.y <= 0 or position.y >= m_sizeScreen.y):
		m_velocity.y *= -1
		
	if (position.x < 0):
		f_endPoint.call(0)
	else:
		if (position.x >= m_sizeScreen.x):
			f_endPoint.call(1)
			
	if (BallColision(m_player1) == false):
		BallColision(m_player2)

func BallColision(player):
	var p = player.GetDimension() / 2.0
	var b = m_dimension / 2.0
	
	if (position.x - b.x <= player.position.x + p.x and position.x + b.x >= player.position.x - p.x and 
		position.y - b.y <= player.position.y + p.y and position.y + b.y >= player.position.y - p.y):	
		m_velocity.x *= -1
		return true		
	return false	

extends Node2D

@export var m_player1 : Node2D
@export var m_player2 : Node2D

@export var m_ball : Node2D

func _ready():	
	m_player1.SetPosition(GetPlayerPosition(-1))
	m_player2.SetPosition(GetPlayerPosition(+1))
	
	m_ball.Init(EndPoint, m_player1, m_player2)
	
func InitBall(ball):
	ball.position = get_viewport_rect().size / 2
	
func GetPlayerPosition(dir):
	var p = get_viewport_rect().size
	
	p.x = p.x / 2.0 + dir * p.x / 3 
	p.y = p.y / 2.0
	
	return p

func EndPoint(player : int):
	m_ball.Start(-1 if player == 1 else 1)

func _process(delta):
	pass

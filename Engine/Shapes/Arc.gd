tool
extends Node2D

class_name Arc

export var InnerRadius = 0.0 setget set_InnerRadius;
export var OutterRadius = 10.0 setget set_OutterRadius;
export(float, 0, 360) var ArcAngle = 90.0 setget set_ArcAngle;
export var NumberOfPoints = 32 setget set_NumberOfPoints;

func set_InnerRadius(value):
	InnerRadius = value;
	update();

func set_OutterRadius(value):
	OutterRadius = value;
	update();

func set_ArcAngle(value):
	ArcAngle = value;
	update();

func set_NumberOfPoints(value):
	NumberOfPoints = value;
	update();

func _draw():
	var points_arc = PoolVector2Array()
	var colors = PoolColorArray([Color(1, 1, 1)])
	var angle_from = ArcAngle / 2;
	var angle_to = -ArcAngle / 2;

	for i in range(NumberOfPoints+1):
		var angle_point = deg2rad(angle_from + i * (angle_to - angle_from) / NumberOfPoints)
		var arc_point = Vector2(cos(angle_point), sin(angle_point));
		points_arc.push_back(arc_point * OutterRadius);
		points_arc.insert(0, arc_point * InnerRadius);
	draw_polygon(points_arc, colors)
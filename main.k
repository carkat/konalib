\l color
\l ray
\l input

rand:{*x+_draw[1;y-x]}

w:800;h:600
player:0.0+400 280 40 40
camera:(20.0+2#player;(h;w)%%2;0.0;1.0)
drawUI:{
	DrawRectangle .'(
	  (0  ;0  ;w;5   ;color.RED)
	  (0  ;5  ;5;h-10;color.RED)
    (w-5;5  ;5;h-10;color.RED)
    (0  ;h-5;w;5   ;color.RED))

	DrawRectangle[10;10;250;113;color.SKYBLUE]
	DrawRectangleLines[10;10;250;113;color.BLUE]
	
  DrawText .'(
	  ("Free 2d camera controls:"      ;20; 20;10;color.BLACK)
    ("- Right/Left to move Offset"   ;40; 40;10;color.DARKGRAY)
    ("- Mouse Wheel to Zoom in-out"  ;40; 60;10;color.DARKGRAY)
    ("- A / S to Rotate"             ;40; 80;10;color.DARKGRAY)
    ("- R to reset Zoom and Rotation";40;100;10;color.DARKGRAY)) }

draw2D:{
	BeginMode2D[camera]
		DrawRectangeRec[(-6000),320 13000 8000;color.DARKGRAY]
		DrawRectangleRec .'buildings
		DrawRectangleRec[player;color.RED]
		t:camera@1
		DrawLine[_*t;10*-h;_*t;h*10;color.GREEN]
		DrawLine[_10*-w;_*|t;w*10;_*|t;color.GREEN]
	EndMode2D[] }

input:{
 :[IsKeyDown[kb.right];player[0]-:0.2;IsKeyDown[kb.left] ;`0:"left is pressed dumbass";""]
 camera[1]:20.0+2#player
 r:&IsKeyDown'(kb.A;kb.S)
 camera[2]:-40|40&(:[~0~#r;(-[;0.1];+[;0.1])@*r;{x}] )@camera@2
 camera[3]:0.1|3.0& _exp(_log camera@3)+0.1*GetMouseWheelMove[] }

draw:{
	BeginDrawing[]
	ClearBackground@color.RAYWHITE
	input[];draw2D[];drawUI[];
	DrawFPS[0;0]
	EndDrawing[] }

buildings:{[n;s]
 ww:rand[50;200]
 hh:rand[100;800]
 yy:(h-130.0)-hh
 xx:s+-6000
 r:,(,/0.0+(xx;yy;ww;hh); (3 {x,rand[50;100]}/()),255)
 :[0<n;r, _f[n-1;s+ww];r] }[100;0]


InitWindow[w;h;"Simple"]
{~WindowShouldClose[]} draw/1
CloseWindow[]


\\

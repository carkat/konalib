\l color
\d ray
InitWindow:"./lib/t.so" 2:("InitWindow_kffi";3)
WindowShouldClose:"./lib/t.so" 2:("WindowShouldClose_kffi";0)
CloseWindow:"./lib/t.so" 2:("CloseWindow_kffi";0)
BeginDrawing:"./lib/t.so" 2:("BeginDrawing_kffi";0)
EndDrawing:"./lib/t.so" 2:("EndDrawing_kffi";0)
ClearBackground:"./lib/t.so" 2:("ClearBackground_kffi";1)
\d ^

draw:{
	ray.BeginDrawing[]
	ray.ClearBackground@color.RAYWHITE
	ray.EndDrawing[]
}
ray.InitWindow[800;600;"Simple"]
while[~ray.WindowShouldClose[];draw[]]
ray.CloseWindow[]


\\

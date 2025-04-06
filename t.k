\l color
\d ray
lib:"./lib/t.so"
InitWindow:lib 2:("InitWindow_kffi";3)
WindowShouldClose:lib 2:("WindowShouldClose_kffi";0)
CloseWindow:lib 2:("CloseWindow_kffi";0)
BeginDrawing:lib 2:("BeginDrawing_kffi";0)
EndDrawing:lib 2:("EndDrawing_kffi";0)
ClearBackground:lib 2:("ClearBackground_kffi";1)
DrawText:lib 2:("DrawText_kffi";5)
\d ^

draw:{
	ray.BeginDrawing[]
	ray.ClearBackground@color.RAYWHITE
	ray.DrawText["Cooking with grease now!!!";10;10;40;color.GREEN]
	ray.EndDrawing[]
}
ray.InitWindow[800;600;"Simple"]
{~ray.WindowShouldClose[]} draw/1
ray.CloseWindow[]


\\

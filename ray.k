lib:"./lib/t.so"
cimport:{ffi[x]:lib 2:(($x),"_kffi";ffi[x])}
kimport:{.($x),":ffi`",$x}
ffi:.((`InitWindow        ;3) // window
      (`WindowShouldClose ;0)
      (`CloseWindow       ;0)
		  (`SetTargetFPS      ;0)
      (`BeginDrawing      ;0) // draw modes
      (`EndDrawing        ;0)
      (`ClearBackground   ;1)
		  (`BeginMode2D       ;1)
		  (`EndMode2D         ;0) // mouse
		  (`EnableCursor      ;0)
		  (`DisableCursor     ;0)
		  (`IsCursorHidden    ;0)
		  (`DrawRectangleRec  ;2) // draw stuff
		  (`DrawLine          ;5)
      (`DrawText          ;5)
		  (`DrawFPS           ;2)
			(`IsKeyDown;1)
			(`IsKeyPressed;1)
			(`IsMouseButtonPressed;1)
			(`GetKeyPressed;0)
			(`GetMouseWheelMove;0)
			(`GetMousePosition;0)
		  (`DrawRectangle     ;5)
		  (`DrawRectangleLines;5)
		  (`MeasureText       ;0))
silent:{cimport'x;kimport'x}@!ffi
ffi:1 // ffi is loaded safely 



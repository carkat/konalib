#include "./inc/kapi.c"
#include "./inc/kona.h"
#include "./inc/raylib.h"
Color color(K a){R((Color){KI(a)[0],KI(a)[1],KI(a)[2],KI(a)[3]});}
K add(K x, K y) {R(gi(Ki(x)+Ki(y)));}
K InitWindow_kffi(K x,K y, K c){ InitWindow(Ki(x),Ki(y),KC(c)); R(gi(1));}
K WindowShouldClose_kffi(K a){ R(gi(WindowShouldClose())); }
K CloseWindow_kffi      (K a){ CloseWindow(); R(gi(1)); }

K BeginDrawing_kffi   (K a){ BeginDrawing();R(gi(1)); }
K EndDrawing_kffi     (K a){ EndDrawing();R(gi(1)); }
K ClearBackground_kffi(K a){ ClearBackground(color(a));R(gi(1)); }

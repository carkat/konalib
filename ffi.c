#include "./inc/kapi.c"
#include "./inc/kona.h"
#include "./inc/raylib.h"
Color color (K a){R((Color){KI(a)[0],KI(a)[1],KI(a)[2],KI(a)[3]});}
Rectangle rectangle(K a){ R((Rectangle){KF(a)[0],KF(a)[1],KF(a)[2],KF(a)[3]}); }
Vector2 vector2(K a){ R((Vector2){KF(a)[0],KF(a)[1]}); }
Vector3 vector3(K a){ R((Vector3){KF(a)[0],KF(a)[1],KF(a)[2]}); }
Camera2D c2d(K a){ R((Camera2D){vector2(KK(a)[0]),vector2(KK(a)[1]),Kf(KK(a)[2]),Kf(KK(a)[3])});}

// de-struct to typed K lists (KI/KF/...)
K kv2 (Vector2 v){ K r=gtn(-2,2);KF(r)[0]=v.x;KF(r)[1]=v.y;R(r); }
K kv3 (Vector3 v){ K r=gtn(-2,3);KF(r)[0]=v.x;KF(r)[1]=v.y;KF(r)[2]=v.z;R(r); }
// de-struct to Generic K lists (KL)
//K kc3D(Camera3D     v){ K r[5]={kv3(v.position),kv3(v.target),kv3(v.up),Kf(v.fovy),Ki(v.projection)};R(KL(r,5)); }
//K krc (RayCollision v){ K r[4]={Ki(v.hit),Kf(v.distance),kv3(v.point),kv3(v.normal)}; R(KL(r,4)); }
//K kray(Ray          v){ K r[2]={kv3(v.position),kv3(v.direction)}; R(KL(r,2)); }

// Window Management
K InitWindow_kffi(K x,K y, K c){ InitWindow(Ki(x),Ki(y),KC(c)); R(gi(1));}
K WindowShouldClose_kffi(K a){ R(gi(WindowShouldClose())); }
K CloseWindow_kffi      (K a){ CloseWindow(); R(gi(1)); }

K BeginDrawing_kffi   (K a){ BeginDrawing();R(gi(1)); }
K EndDrawing_kffi     (K a){ EndDrawing();R(gi(1)); }
K ClearBackground_kffi(K a){ ClearBackground(color(a));R(gi(1)); }
K DrawText_kffi       (K s,K i,K j,K l,K c){ DrawText(KC(s),Ki(i),Ki(j),Ki(l),color(c));R(gi(1)); }

//K BeginMode3D_kffi    (K a){ BeginMode3D(c3d(a)); R(gi(1));}
//K EndMode3D_kffi      (K a){ EndMode3D();R(gi(1)); }
K BeginMode2D_kffi    (K a){ BeginMode2D(c2d(a)); R(gi(1));}
K EndMode2D_kffi      (K a){ EndMode2D(); R(gi(1));}
K SetTargetFPS_kffi   (K a){ SetTargetFPS(Ki(a)); R(gi(1));}
K EnableCursor_kffi   (K a){ EnableCursor(); R(gi(1));}
K DisableCursor_kffi  (K a){ DisableCursor(); R(gi(1));}
K IsCursorHidden_kffi (K a){ R(gi(IsCursorHidden()));;}


// Draw2D Things
K DrawRectangleRec_kffi  (K r,K c){ DrawRectangleRec(rectangle(r),color(c)); R(gi(1)); }
K DrawLine_kffi          (K i,K j,K k,K l,K c){ DrawLine(Ki(i),Ki(j),Ki(k),Ki(l),color(c)); R(gi(1));}
K DrawRectangle_kffi     (K i,K j,K k,K l,K c){ DrawRectangle(Ki(i),Ki(j),Ki(k),Ki(l),color(c)); R(gi(1));}
K DrawRectangleLines_kffi(K i,K j,K k,K l,K c){ DrawRectangleLines(Ki(i),Ki(j),Ki(k),Ki(l),color(c)); R(gi(1));}
K MeasureText_kffi       (K s,K i){ R(gi(MeasureText(KC(s),Ki(i)))); }
K DrawFPS_kffi           (K i,K j){ DrawFPS(Ki(i),Ki(j)); R(gi(1));}

K IsKeyDown_kffi           (K a){ R(gi(IsKeyDown(Ki(a))));}
K IsKeyPressed_kffi        (K a){ R(gi(IsKeyPressed(Ki(a))));}
K IsMouseButtonPressed_kffi(K a){ R(gi(IsMouseButtonPressed(Ki(a))));}
K GetKeyPressed_kffi       (K a){ R(gi(GetKeyPressed()));}
K GetMouseWheelMove_kffi(K a){R(gf(GetMouseWheelMove()));}
K GetMousePosition_kffi (K a){R(kv2(GetMousePosition()));}
// Camera
//K UpdateCamera_kffi(K a){ Camera3D c;f(a,c=c3d(l[0]);UpdateCamera(&c,gi(l[1])));R(kc3D(c)); }

/*
// State

// Draw3D Things 
K DrawCube_kffi     (K a){ v(f(a,DrawCube     (vector3(l[0]),gf(l[1]),gf(l[2]),gf(l[3]),color(l[4])))); }
K DrawCubeWires_kffi(K a){ v(f(a,DrawCubeWires(vector3(l[0]),gf(l[1]),gf(l[2]),gf(l[3]),color(l[4])))); }
K DrawGrid_kffi     (K a){ v(f(a,DrawGrid(gi(l[0]),gf(l[1])))); }

// Keyboard Input Handlers

	// Collisions Detection
K GetScreenToWorldRay_kffi(K a){ Ray r;         f(a,(r=GetScreenToWorldRay(vector2(l[0]),c3d(l[1])))); R(kray(r)); }
K GetRayCollisionBox_kffi (K a){ RayCollision r;f(a,(r=GetRayCollisionBox(ray(l[0]), bbox(l[1]))));    R(krc(r));  }

// Structs
Color color        (K a){ int    l[4];IK(l,a); Color     r=    (Color){l[0],l[1],l[2],l[3]};                            R(r); }
// Structs using malloc (aka f macro)
BoundingBox bbox   (K a){ BoundingBox r;       f(a,     (r=(BoundingBox){vector3(l[0]),vector3(l[1])}));                                        R(r); }
Camera2D c2d       (K a){ Camera2D r;          f(a,     (r=(Camera2D)   {vector2(l[0]),vector2(l[1]),gf(l[2]),gf(l[3])}));                      R(r); }
Ray ray            (K a){ Ray r;               f(a,     (r=(Ray)        {vector3(l[0]),vector3(l[1])}));                                        R(r); }

*/

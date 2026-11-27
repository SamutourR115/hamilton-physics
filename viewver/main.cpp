#include <raylib.h>

int main(void){

    InitWindow(800, 600, "Physics Engine");
    SetTargetFPS(60);

    while(!WindowShouldClose()){
        ClearBackground(RAYWHITE);
        EndDrawing();
    }

    CloseWindow();
    return 0;
}


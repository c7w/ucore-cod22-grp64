#include <ulib.h>
#include <string.h>
#include <dir.h>
#include <file.h>
#include <error.h>
#include <stdio.h>
#include <unistd.h>

#define ll long long

#define WIDTH 100
#define HEIGHT 75
#define FPS 10
#define SECOND 60
#define VIDEO_LENGTH FPS * SECOND

#define printf(...)                     fprintf(1, __VA_ARGS__)

ll get_time() {
    int* mtime = 0x200BFF8;
    int* mtime_upper = 0x200BFFC;
    ll time = ((ll)(*mtime_upper) << 32) + *mtime;
    return time;
}

void wait_for_tick(ll wait_until) {
    while( get_time() <= wait_until ) {
        // Wait
        __asm__ __volatile__ ("nop");
    }
}


int main() {
    printf("Video is running!\n");
    
    // [0, frame_cnt)
    for (int i = 0; i < VIDEO_LENGTH; i += 1) {

        ll curr_time = get_time();

        for (int j = 0; j < (WIDTH * HEIGHT); j += 4) {
            *(int*)(0x81000000 + j) = *(int*)(0x80800000 + i * (WIDTH * HEIGHT) + j);
        }

        printf("[Video] Tick %d\n", i);

        // mtime increase 10M per real second.
        // namely 1M per 1/10 second
        wait_for_tick(curr_time + 10000000 / FPS);
    }
    printf("vga pass.\n");
}

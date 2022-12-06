#define ll long long
#define FPS 75
#define VIDEO_LENGTH (100 * FPS * FPS * 6)

ll get_time() {
    int* mtime = 0x200BFF8;
    int* mtime_upper = 0x200BFFC;
    ll time = ((ll)(*mtime_upper) << 32) + *mtime;
    return time;
}

// mtime increase 10M per real second.
// namely 133,333 per 1/75 second
void wait_for_tick() {
    ll cnt = 0;
    ll curr_time = get_time();

    while( get_time() <= curr_time + 133333 ) {
        // Wait
        __asm__ __volatile__ ("nop");
    }
}


int main() {
    
    for (int i = 0; i < VIDEO_LENGTH; i += 100 * FPS) {

        int color = 0;

        if ( (i/FPS) % 3 == 0) {
            color = 0b00000011000000110000001100000011;
        } else if ( (i/FPS) % 3 == 1) {
            color = 0b00011100000111000001110000011100;
        } else {
            color = 0b11100000111000001110000011100000;
        }

        for (int j = 0; j < 100 * FPS; j += 4) {
            *(int*)(0x81000000 + j) = color;
        }
        printf("Waiting for tick")
        wait_for_tick();
    }

}
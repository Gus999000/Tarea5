#include <stdio.h>
#include <unistd.h>
#include <time.h>

// Funcion factorial
int factorial(int n);
int c_factorial(int n) {
    int ret = 1;
    while(n > 1) {
        ret *= n;
        n--;
        }
        return ret;
}

// Funcion potencia/exponenciacion
int powi(int base, int exp);
int c_powi(int base, int exp) {
    int ret = 1;
    while(exp--) ret *= base;
    return ret;
}

// Funcion Ackermann
// Detalle: Esta funcion crece muy rapido!
int ackermann(int m, int n);
int c_ackermann(int m, int n) {
    if(m == 0) return n + 1;
    if(n == 0) return c_ackermann(m - 1, n);
    return c_ackermann(m - 1, c_ackermann(m, n - 1));
}

unsigned int get_tick() {
    struct timespec ts;
    unsigned int tick = 0;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    tick = ts.tv_nsec / 1000000;
    tick += ts.tv_sec * 1000;
    return tick;
}

int main() {
    int tick1 = get_tick();
    for(int i = 0; i < 10000; i++) factorial(12);
    int tick2 = get_tick();
    printf("Factorial asm: %d\n", (tick2 - tick1)/ 10000);
    tick1 = get_tick();
    for(int i = 0; i < 10000; i++) c_factorial(12);
    tick2 = get_tick();
    printf("Factorial C: %d\n", (tick2 - tick1)/ 10000);
    tick1 = get_tick();
    for(int i = 0; i < 10000; i++) powi(2, 30);
    tick2 = get_tick();
    printf("Powi asm: %d\n", (tick2 - tick1)/ 10000);
    tick1 = get_tick();
    for(int i = 0; i < 10000; i++) c_powi(2, 30);
    tick2 = get_tick();
    printf("Powi C: %d\n", (tick2 - tick1)/ 10000);
    tick1 = get_tick();
    for(int i = 0; i < 10000; i++) ackermann(3, 9);
    tick2 = get_tick();
    printf("Ackermann asm: %d\n", (tick2 - tick1)/ 10000);
    tick1 = get_tick();
    for(int i = 0; i < 10000; i++) c_ackermann(3, 9);
    tick2 = get_tick();
    printf("Ackermann C: %d\n", (tick2 - tick1)/ 10000);
    return 0;
}
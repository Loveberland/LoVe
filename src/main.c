#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <pthread.h>
#include <unistd.h>
#include <time.h>

typedef struct {
        int id;
        int seconds;
        uint64_t operations;
        double result;
} pthread_data;



int main(int argc, char *argv[]) {
        int seconds = 10;

        if (argc >= 2) {
                seconds = atoi(argv[1]);
        }

        int cpu_cnt = sysconf(_SC_NPROCESSORS_ONLN);

        puts("CPU Benchmark\n");
        printf("Logical CPU: %d\n", cpu_cnt);
        printf("Duration: %d seconds\n\n", seconds);

        // pthread_t *threads = malloc(sizeof(pthread_t) * cpu_cnt);
        // pthread_data *data = malloc(sizeof(pthread_data) * cpu_cnt);
        return 0;
}

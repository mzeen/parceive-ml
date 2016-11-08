#include <stdio.h>
#include <stdlib.h>
#include "time.h"
#include <unistd.h>

int base_weight;
long super_dummy = 0;

void gen_data(int *data, int variance, int n){

    int factor = 1, i;

    for(i = 0; i < n; i++){
        data[i] = base_weight * (factor++ % variance + 1);
    }

}

void do_work(int weight){
  
    /*int dummy = 0, i; 
    for(i = 0; i < weight*weight; i++)
        dummy += i;*/
    usleep(weight*weight);
   
    //super_dummy += dummy;  
}

int main(int argc, char *argv[]){

//    struct timespec begin, end;

//    clock_gettime(CLOCK_MONOTONIC, &begin);


    if ( argc != 4 ) /* argc should be 3 for correct execution */
    {
        printf( "Invalid number of arguments! %d", argc );
        return 0;
    }

    int load_variance = atoi(argv[1]), i, NUM_TASKS = atoi(argv[2]);
    base_weight = atoi(argv[3]);
    int *data = malloc(NUM_TASKS * sizeof(int));

    // Generate an array with NUM_TASKS elements that represents jobs to be done.
    // Load_variance specifies the load_imbalance factor of the tasks.

    gen_data(data, load_variance, NUM_TASKS);
  
    for(i = 0; i < NUM_TASKS; i++){
        do_work(data[i]);
    }
    free(data);
    //printf("\nResult %ld", super_dummy);
 //   clock_gettime(CLOCK_MONOTONIC, &end);
 //   printf("%.5f ", ((double)end.tv_sec + 1.0e-9*end.tv_nsec) -
 //                    ((double)begin.tv_sec + 1.0e-9*begin.tv_nsec));
}

//
// Created by os on 2/6/22.
//

#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"

void main(){
    fork();
    for(int i=0;i<10000;i++)
        for(int j=0;j<20000;j++);
    printf("zavrsio");
    exit(0);
}
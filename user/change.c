#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"

int
main(int argc, char **argv)
{

    if(argc !=3 || (argc==3 && atoi(argv[2])==0)){
        fprintf(2,"Error params");
        exit(1);
    }

    change(atoi(argv[1]),atoi(argv[2]));
    exit(1);
}


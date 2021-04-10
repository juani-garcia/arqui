// main.c
#include <assert.h>
int puts(const char* str);

int main(){
    int res = puts("Hola mundo! \n");
    assert(res == 4);
    return 0;
}


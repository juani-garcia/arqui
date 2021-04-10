int sys_open(const char * filename, int mode);
int sys_close(int fd);
int sys_write(int fd, const char * string, int len);
int sys_read(int fd, char * buffer, int len);

static int _strlen(const char * str);

int main(){
    int a = sys_open("a.txt", 0);
    int b = sys_open("b.txt", 0);
    int out = sys_open("out.txt", 1);
    if(a < 0 || b < 0 || out < 0){
        return -1;
    }

    char msg1[10], msg2[10];
    int test1, test2;
    test1 = sys_read(a, msg1, 5);
    test2 = sys_read(b, msg2, 5);
    if(test1 < 0 || test2 < 0){
        return -2;
    }

    test1 = sys_write(out, msg1, _strlen(msg1));
    test2 = sys_write(out, msg2, _strlen(msg2));
    if(test1 < 0 || test2 < 0){
        return -3;
    }
    
    sys_close(a);
    sys_close(b);
    sys_close(out);
    return 0;
}

static int _strlen(const char * str){
    int i = 0;
    while(*(str + i++));
    return i - 1;
}
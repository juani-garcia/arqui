int sys_open(const char * filename, int mode);
int sys_close(int fd);
int sys_write(int fd, const char * buffer, int len);
int sys_read(int fd, char * buffer, int len);

static int _strlen(const char * str);

int main(){
    int fd = sys_open("log.txt", 2);
    char msg[] = "Hola Mundo!";
    sys_write(fd, msg, _strlen(msg));
    sys_close(fd);
    return fd;
}

static int _strlen(const char * str){
    int i = 0;
    while(*(str + i++));
    return i - 1;
}
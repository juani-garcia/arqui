int sys_open(const char * filename, int mode, int permits);
int close(int fd);
int write_to(int fd, const char * buffer, int len);
int read_from(int fd, char * buffer, int len);

int main(){
    int fd = sys_open("log.txt", 2, 777);
    return fd;
}
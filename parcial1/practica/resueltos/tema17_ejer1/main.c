// main.c
#define STDIN 0
#define STDOUT 1
#define READ_FROM "From which file do you want to read? (Empty for STDIN): "
#define PROMPT "Write a 15 character string: "
#define READ_ERROR "Less than 15 characters were read. Exiting main... \n"
#define INVERTED "The inverted string is: "
#define SIZE 15
#define MAXLEN 100

unsigned int sys_open(const char * filename, int mode);
unsigned int sys_read(int fd, char *buffer, unsigned int len);
unsigned int sys_write(int fd, const char *string, unsigned int len);

void invert(char *str);
unsigned int _strlen(const char *str);
unsigned int strtofd(const char * filename);
void print(unsigned int fd, const char * str);

int main(){
    unsigned int read;
    char msg[SIZE + 1], filename[MAXLEN];
    print(STDOUT, READ_FROM);
    read = sys_read(STDIN, filename, MAXLEN);
    filename[read - 1]= 0;
    int fd = strtofd(filename);
    read  = sys_read(fd, msg, SIZE + 1);
    if(read < SIZE || (read == SIZE && msg[SIZE] != '\n')){ 
        print(STDOUT, "\n");
        print(STDOUT,READ_ERROR);
        return read;
    }
    msg[SIZE] = 0;
    invert(msg);
    print(STDOUT, "\n");
    print(STDOUT, INVERTED);
    print(STDOUT, msg);
    print(STDOUT, "\n");
	return 0;
}

unsigned int _strlen(const char *str){
    int i = 0;
    while(*(str + i++));
    return i - 1;
}

void invert(char * str){
    int left = 0, right = _strlen(str) - 1;
    char aux;
    while(left < right){
        aux = str[left];
        str[left] = str[right];
        str[right] = aux;
        right--;
        left++;
    }
    return;
}

void print(unsigned int fd, const char * str){
    sys_write(fd, str, _strlen(str));
    return;
}

unsigned int strtofd(const char * filename){
    if (filename[0] == 0)
        return STDIN;
    return sys_open(filename, 0);
}
// main.c
#define READ 3
#define BAD_READ "Error reading files - Check permits. Exiting main...\n"
#define INVALID "Invalid numbers in files. Exiting main...\n"
// Funciones con syscalls hechas en libasm.s
int sys_write(int fd, const char *buffer, int size);
int sys_read(int fd, char * buffer, int size);
int sys_close(int fd);
int sys_open(const char * fileName, int mode, int perm);

// Funciones nuestras para manejo de strings
int strtonum(const char * str);
int isValid(char * num);
void numtostr(int num, char * ans);
int numlen(int num);
int _strlen(const char * str);


int main(){
    int fd_a = sys_open("a.txt", 0, 666);
    int fd_b = sys_open("b.txt", 0, 666);
	int fd_c = sys_open("c.txt", 1, 666);
    char num1[READ + 1];
    char num2[READ + 1];

    int a = sys_read(fd_a, num1, READ);
    num1[a] = 0;
    int b = sys_read(fd_b, num2, READ);
    num2[b] = 0;

    if(a == 0 || b == 0){
        sys_write(1, BAD_READ, _strlen(BAD_READ));
        return 1;
    }

    if(!isValid(num1) || !isValid(num2)){
        sys_write(1, INVALID, _strlen(INVALID));
        return 1;
    }
    int num3 = strtonum(num1) * strtonum(num2);
    char ans[(2 * READ) + 1];
    numtostr(num3, ans);
    sys_write(fd_c, ans, _strlen(ans));

    sys_close(fd_a);
    sys_close(fd_b);
    sys_close(fd_c);

    return 0;
}

int isValid(char * num){
	for (int i = 0; num[i]; i++){ // -20
        if (!(num[i] == '-' && i == 0) && !(num[i] <= '9' && num[i] >= '0'))
            return 0;
	}
	return 1;
}



int strtonum(const char * str){
    int res = 0, i = 0, sign = 1;

    if (str[i] == '-'){
        sign = -1;
        i++;
	}

    for (; str[i]; i++)
        res = (res * 10) + (str[i] - '0');

    return sign * res;
}

void numtostr(int num, char * ans){
    int len = numlen(num), upTo = 0;
    if (num < 0){
        ans[0] = '-';
        len++;
        upTo = 1;
        num *= -1;
	}
	for (int i = len - 1; i >= upTo; i--, num /= 10) 
        ans[i] = (num % 10) + '0';
    ans[len] = 0;
    return;
}

int numlen(int num){
    int i;
    for(i = 0; num; i++, num /= 10);
    return i == 0 ? 1 : i;
}

int _strlen(const char * str){
    int i = 0;
    while(*(str + i++));
    return i - 1;
}
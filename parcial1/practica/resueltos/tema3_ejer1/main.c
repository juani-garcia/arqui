#include <sys/wait.h>
#define STDOUT 1
#define MAX 10

int sys_write(int fd, const char *buffer, int len);
int sys_getpid();
int sys_fork();
void sys_sleep();
void sys_wait();

int _strlen(const char * str);
void numtostr(int num, char * res);
void print(int fd, const char * buffer);
int numlen(int num);

int main(){
	char pid[MAX];
    int ans = sys_fork();
    if (ans){  
        numtostr(sys_getpid(), pid);
        print(STDOUT, "Pid del padre: ");
        print(STDOUT, pid);
        sys_sleep();
	} else { 
        numtostr(sys_getpid(), pid);
        print(STDOUT, "Pid del hijo: ");
        print(STDOUT, pid);
	}
	return 0;
}

void print(int fd, const char * buffer){
    sys_write(fd, buffer, _strlen(buffer));
    return;
}

int _strlen(const char * str){
    int i = 0;
    while(*(str + i++));
    return i - 1;
}

void numtostr(int num, char * res){ 
    int len = numlen(num), upTo = 0;
    if (num < 0){
        res[0] = '-';
        len++;
        upTo = 1;
        num *= -1;
	}
	for (int i = len - 1; i >= upTo; i--, num /= 10) 
        res[i] = (num % 10) + '0';
    res[len] = '\n';
    res[len + 1] = 0;
    return;
}

int numlen(int num){
    int i = 0;
    while(num != 0){
        num /= 10;
        i++;
    }
    return i==0? 1 : i;
}
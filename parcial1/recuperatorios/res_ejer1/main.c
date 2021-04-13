/*
main.c
Objetivo: 
Su programa debe leer diez números ingresados por pantalla y luego informar el o los números que menos veces se repiten.
*/
#define STDIN 0
#define STDOUT 1
#define LEN 10
#define MAX 100
#define MSG "Ingrese un numero: "
#define RTA "Los numeros que menos se repiten son:\n"

// Funciones de input-outputs
int sys_write(int fd, const char *buffer, int size);
int sys_read(int fd, char * buffer, int size);

// Funciones nuestras para manejo de strings
int strtonum(const char * str);
int isValid(char * num);
void numtostr(int num, char * ans);
int numlen(int num);
int _strlen(const char * str);

int main(){
	int numbers[LEN], len;
    char str[MAX + 1];
    for (int i = 0; i < LEN; i++){
        sys_write(STDOUT, MSG, _strlen(MSG));
	    len = sys_read(STDIN, str, MAX);
		str[len - 1] = 0;
		if (!isValid(str))
			return 1;
		numbers[i] = strtonum(str);
	}

    int repetitions[LEN];
    for(int i = 0; i < LEN; i++){
        repetitions[i] = 1;
    }

    for (int i = 0; i < LEN; i++)
        if(repetitions[i]!=-1)
            for (int j = i+1; j < LEN; j++)
                if (numbers[i] == numbers[j]){
                    repetitions[i]++; // si numbers es {2, 2, 2, 2, 1} --> {4, -1, -1, -1, 1}
                    repetitions[j] = -1;
                }

    int min = LEN + 1;
    int i=0;
    for (; i < LEN; i++){
        if (repetitions[i] < min && repetitions[i]!=-1){
            min = repetitions[i];
        }
    }
    
    sys_write(STDOUT, RTA, _strlen(RTA));
    for(int k=0; k < LEN; k++){
        if(repetitions[k]==min){
            numtostr(numbers[k], str);
            sys_write(STDOUT, str, _strlen(str));
            sys_write(STDOUT, "; ", 2);
        }
    }
    sys_write(STDOUT, "\n", 1);
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
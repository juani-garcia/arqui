#define MAXLEN 100 // No puedo alocar memoria dinamicamente

int sys_read(char * buffer, int len);
int sys_write(const char * buffer, int len);
int separate(const char * line, char * first, char * second);
int strlen(const char * str);
void num_to_str(int num, char *res);
int str_to_num(const char *str);
int numlen(int num);

int main(int argc, char *argv[]){
    char line[MAXLEN];                  
    char str1[MAXLEN], str2[MAXLEN];

    sys_read(line, MAXLEN);     // guardo mi entrada estandar en line

    int check = separate(line,str1,str2);   // separo en str1 y str2 mi line
    if (check < 0)
        return -1;
    int num1 = str_to_num(str1), num2 = str_to_num(str2);  //convierto a int las cadenas
    int sum = num1 + num2;
    char res[strlen(str1) + strlen(str2) + 1];       
    num_to_str(sum, res);
    
    sys_write(res, strlen(res));

    return sum;
}

int str_to_num(const char * str){
    int res = 0, i = 0, sign = 1;

    if (str[i] == '-'){
        sign = -1;
        i++;
	}
        
    for (; str[i]; i++){
        res = (res * 10) + (str[i] - '0');
    }

    return sign * res;
}

int separate(const char * line, char * first, char * second){
	int idx = 0, i = 0;
    if(line[0] == '-')
        first[idx++] = line[i++];
	char found_space = 0;
	for (; line[i] && line[i] != '\n'; i++){
        if (!(line[i] <= '9' && line[i] >= '0') && line[i] != ' ')
            return -1;
		if (line[i] == ' '){
            if (found_space)
				return -1;
			first[idx] = 0;
			idx = 0;
			found_space = 1;
            if(line[i+1] && line[i+1] == '-'){
                i++;
                second[idx++] = line[i];
            }
			continue;
		}
		if (!found_space)
			first[idx++] = line[i];
		else
			second[idx++] = line[i];
	}
    if (idx == 0)
        return -1;

    if (!found_space)
		return -1;

	second[idx] = 0;
	
	return 1;
}

void num_to_str(int num, char * res){ 
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

int strlen(const char * str){
    int i = 0;
    while(*(str + i++));
    return i - 1;
}

int numlen(int num){
    int i = 0;
    while(num != 0){
        num /= 10;
        i++;
    }
    return i==0? 1 : i;
}
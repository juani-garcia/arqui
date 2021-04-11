int numtostr(int num, int pos, char*buff);
int toInt(char * buff, int len);
int power(int num, int p);

void numtostr(int num, char * str);
void transformTime(char* str,int sec);

int strleng(char * buff);

void strconcat(char * a, char * b, char * c);

int prod(char * a, char * b, char * c);
int strtoint(char * buff, int len);
int power(int num, int p);
int inttostr(int num, int pos, char*buff);



//Funciones

int numtostr(int num, int pos, char*buff){			// 64 bits
	if(num/10<1){
		buff[pos] = num +'0';
		return pos+1;
	}
	int newpos= numtostr((int)num/10,pos,buff);
	buff[newpos] = num%10 +'0';
	return newpos+1;
}

int toInt(char * buff, int len){
	int res = 0;
	int num;
	for(int i=0; i<len; i++){
		if (buff[i]<'0'||buff[i]>'9'||i>len-1){
            		return -1;
        	}
		
		res+=power(buff[i]-'0', len-i-1);
	}
	return res;
}

int power(int num, int p){
	int res = 1;
	for(int i=0; i<p; i++){
		res*=10;
	}
	return num * res;
}

// *********************************************************************************************************************************************

void numtostr(int num, char * str){
	int i, rem, len = 0, n;
	n = num;
	while (n != 0)
	{
	  len++;
	  n /= 10;
	}
	for (i = 0; i < len; i++)
	{
	  rem = num % 10;
	  num = num / 10;
	  str[len - (i + 1)] = rem + '0';
	}
}


void transformTime(char* str,int sec){
	sec += UTC*3600;
	int minutes = sec/60;
	int hours = sec/3600;
	int days = sec/86400;
	int months = sec/(86400*31);
	int year = sec/(86400*365);
	sec %= 60;
	minutes %= 60;
	hours = hours % 24;
	days%=31;
	months%=12;
	year += 1970;

	numtostr(year, str);
	numtostr(months, str+5);
	numtostr(days, str+8);
	numtostr(hours, str+11);
	numtostr(minutes, str+14);
	numtostr(sec, str+17);
}

// *********************************************************************************************************************************************

int strleng(char * buff){
	int i = 0;
	while(buff[i] != 0){
		i++;
	}
	return i;
}

// *********************************************************************************************************************************************


void strconcat(char * a, char * b, char * c){		// No estoy chequeando que pasa si alguno de los archivos tiene menos de 10 caracteres!!!
	for(int i=0; i< READ; i++){
		c[i] = a[i];
		c[READ+i] = b[i];
	}
	return;
}

// *********************************************************************************************************************************************


int prod(char * a, char * b, char * c){
	int num1 = strtoint(a, READ);
	int num2 = strtoint(b, READ);
	if(num1<0 || num2<0){
		write(1,error, err);
		return -1;
	}
	int res = num1*num2;
	int len = inttostr(res,0,c);
	
	return len;
}

int strtoint(char * buff, int len){
	int res = 0;
	int num;
	for(int i=0; i<len; i++){
		if (buff[i]<'0'||buff[i]>'9'){
            		return -1;
        	}
		
		res+=power(buff[i]-'0', len-i-1);
	}
	return res;
}

int power(int num, int p){
	int res = 1;
	for(int i=0; i<p; i++){
		res*=10;
	}
	return num * res;
}

int inttostr(int num, int pos, char*buff){			// 64 bits
	if(num/10<1){
		buff[pos] = num +'0';
		return pos+1;
	}
	int newpos= inttostr((int)num/10,pos,buff);
	buff[newpos] = num%10 +'0';
	return newpos+1;
}










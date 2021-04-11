// Declarar funciones asm

int write(int fd, void *buffer, int size);
int read(int fd, char *buff, int size);
//void numtostr(int c, char *buff, int buffsize);		if 32 bit


// Programa
int numtostr(int num, int pos, char*buff);
int reading(char * buffer);
int toInt(char * buff, int len);
int power(int num, int p);


static int SIZE = 12;
static char * error = "ERROR\n";
static int errlen = 7;

int main(int argc, char * argv[]){

	
	char buffer[SIZE];
	int num1 = reading(buffer);
	if(num1 == -1){
		write(1,error,errlen);
		return -1;
	}
	
	int num2 = reading(buffer);
	
	if(num2 == -1){
		write(1,error,errlen);
		return -1;
	}
	
	int result = num1+num2;
	
	
	// imprimir result
	//numtostr(result,buffer,SIZE);		// if 32bit
	char res[SIZE];
	int size = numtostr(result, 0, res);
	res[size] = '\n';
	write(1,res,size+1);
	
	return 0;
}


int numtostr(int num, int pos, char*buff){			// 64 bits
	if(num/10<1){
		buff[pos] = num +'0';
		return pos+1;
	}
	int newpos= numtostr((int)num/10,pos,buff);
	buff[newpos] = num%10 +'0';
	return newpos+1;
}

int reading(char * buffer){
	int reading;
	reading = read(0,buffer,SIZE);
	if(reading<=0 || reading >= SIZE){
		write(1,error,errlen);
		return -1;
	}
	
	int num = toInt(buffer,reading-1);
	
	
	return num;
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




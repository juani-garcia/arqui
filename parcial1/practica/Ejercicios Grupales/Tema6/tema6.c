// Funciones asm
int read(unsigned int fd, const char *buffer, int size);
int write(unsigned int fd, char *buffer, int size);
int creat();
int open(const char *filename, int access, int permit);
int close(int fd);


// Funciones c
int prod(char * a, char * b, char * c);
int strtoint(char * buff, int len);
int power(int num, int p);
int inttostr(int num, int pos, char*buff);



static char * error = "ERROR\n";
static int err = 7;
static int MAX = 10;
static int READ = 3;

int main(int argc, char * argv[]){
	char buffer[MAX];
	char readA[READ];
	char readB[READ];
	
	int c = creat();
	
	if(c<0){
		write(1,error, err);
		return -1;
	}
	
	int a = open("A.txt", 2, 0770);
	int b = open("B.txt", 2, 0770);
	if(a<0 || b<0){
		write(1,error, err);
		return -1;
	}
	
	int ra = read(a, readA, READ);
	int rb = read(b, readB, READ);
	if(ra<0 || rb<0){
		write(1,error, err);
		return -1;
	}
	
	int len = prod(readA,readB, buffer); // Hacer nros del string, multiplicarlos, hacer string de los nros, cargarlos al buffer
	
	int co = open("C.txt", 2, 0770);
	if(co<0){
		write(1,error, err);
		return -1;
	}
	
	int w = write(co, buffer, len);
	if(w<0){
		write(1,error, err);
		return -1;
	}
	close(co);
	close(b);
	close(a);
	
	return 0;
}

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







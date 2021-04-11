// Funciones asm
int read(unsigned int fd, const char *buffer, int size);
int write(unsigned int fd, char *buffer, int size);
int creat();
int open(const char *filename, int access, int permit);
int close(int fd);


// Funciones c
void strconcat(char * a, char * b, char * c);

static char * error = "ERROR\n";
static int err = 7;
static int MAX = 30;
static int READ = 10;

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
	
	strconcat(readA,readB, buffer);
	
	int co = open("C.txt", 2, 0770);
	if(co<0){
		write(1,error, err);
		return -1;
	}
	
	int w = write(co, buffer, READ*2);
	if(w<0){
		write(1,error, err);
		return -1;
	}
	close(co);
	close(b);
	close(a);
	
	return 0;
}

void strconcat(char * a, char * b, char * c){		// No estoy chequeando que pasa si alguno de los archivos tiene menos de 10 caracteres!!!
	for(int i=0; i< READ; i++){
		c[i] = a[i];
		c[READ+i] = b[i];
	}
	return;
}

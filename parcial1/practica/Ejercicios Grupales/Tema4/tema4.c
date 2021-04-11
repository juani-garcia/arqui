// Funciones asm
int read(unsigned int fd, const char *buffer, int size);
int write(unsigned int fd, char *buffer, int size);
int creat();
int open(const char *filename, int access, int permit);
int close(int fd);

// Funciones c
int strleng(char * buff);

static char * error = "ERROR\n";
static int err = 7;
static int MAX = 100;

int main(int argc, char * argv[]){
	char buffer[MAX];
	int r = read(0,buffer,MAX);
	int c = creat();
	if(r<0 || c<0){
		write(1,error, err);
		return -1;
	}
	int o = open("arc.txt", 2, 0770);
	if(o<0){
		write(1,error, err);
		return -1;
	}
	int w = write(o, buffer, strleng(buffer));
	if(w<0){
		write(1,error, err);
		return -1;
	}
	close(o);
	
	
	return 0;
}

int strleng(char * buff){
	int i = 0;
	while(buff[i] != 0){
		i++;
	}
	return i;
}


/*
https://jameshfisher.com/2017/02/24/what-is-mode_t/

Para crear un archivo, los codigos para los permisos
se pueden encontrar en esa pag. Basicamente, que 
representa mode_t
*/


// Funciones asm
int fork();

// Funciones c
static char * error = "ERROR\n";
static int err = 7;

int main(int argc, char * argv[]){
	int n = fork();
	if(n<0){
		write(1,error, err);
		return -1;
	}
	return 0;
}

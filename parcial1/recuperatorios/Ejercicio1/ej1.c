/*

Objetivo:

Su programa debe leer diez números ingresados por pantalla y luego informar el o los números que menos veces se repiten.

*/

// Funciones asm
int read(unsigned int fd, const char *buffer, int size);
int write(unsigned int fd, char *buffer, int size);

//Funciones c
int strleng(char * buff);
int strtoint(char * buff, int len);
int power(int num, int p);
int minOccur(int * arr, int len);
int printnum(int num);
int inttostr(int num, int pos, char*buff);
void printline();

static int SIZE = 10;
static char * rError = "Read error\n";
static int rerrlen = 12;
static char * wError = "Write error\n";
static int werr = 13;


int main(int argc, char * argv[]){

	char buffer[SIZE];
	int nums[SIZE];
	int val;
	int num;
	
	for(int i=0; i<SIZE; i++){
		val = read(0,buffer,SIZE);
		if(val<0){
			write(1,rError,rerrlen);
			return -1;
		}
		int length = strleng(buffer);
		buffer[length - 1] = '\0';
		num = strtoint(buffer,length-1);
		if(num == -1){
			return -1;
		}
		nums[i] = num;
	}
	
	int error = minOccur(nums,SIZE);


	return error;
}

int strleng(char * buff){
	int i = 0;
	while(buff[i] != 0){
		i++;
	}
	return i;
}

int strtoint(char * buff, int len){
	int res = 0;
	int num;
	for(int i=0; i<len; i++){
		if (buff[i]<'0'||buff[i]>'9'){	// Lee numeros positivos
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

int minOccur(int * arr, int len){
	int occur[len][2];
	for(int i=0; i<len; i++){
		occur[i][0] = 0;
		occur[i][1] = 0;
	}
	int index = 0;
	int flag = 0;
	int minOccur;
	int error = 0;
	for(int i=0; i<len; i++){				// Veo cuantas veces aparece cada numero
		for(int j=0; j<index && flag == 0; j++){
			if(arr[i] == occur[j][0]){
				occur[j][1] +=1;
				flag = 1;
			}
		}
		if(flag==0){
			occur[index][0] = arr[i];
			index++;
		}
		flag = 0;
	}
	
	for(int k=0; k<index; k++){				// Veo cual es el menor numero de apariciones
		if(k==0){
			minOccur = occur[k][1];
		}
		else{
			if(minOccur > occur[k][1]){
				minOccur = occur[k][1];
			}
		}
	}
	
	write(1, "Se repiten menos veces: ", 24);
	
	for(int i=0; i<index && error ==0; i++){
		if(occur[i][1] == minOccur){
			
			error = printnum(occur[i][0]);
		}
	}
	printline();
	return error;
}

int printnum(int num){
	int e = write(1,"\nNumero: ",10);
	char buff[SIZE];
	int len = inttostr(num,0,buff);

	int w = write(1, buff, len);
	if(w<0 || e<0){
		write(1,wError, werr);
		return -1;
	}

	return 0;
}

int inttostr(int num, int pos, char*buff){
	if(num/10<1){
		buff[pos] = num +'0';
		return pos+1;
	}
	int newpos= inttostr((int)num/10,pos,buff);
	buff[newpos] = num%10 +'0';
	return newpos+1;
}

void printline(){
	write(1,"\n",2);
}







//Funciones asm
int time();
int write(int fd, void *buffer, int size);

//Funciones c
void numtostr(int num, char * str);
void transformTime(char* str,int sec);


static char * date= "Date time:\n";
static int len = 12;
static unsigned int UTC = -3;	//Buenos Aires

int main(int argc, char * argv[]){				// NOTA: Me da 3 dias atrasado, no se por que
	
	write(1,date,len);
	
	int timeInSec = time();
	char str[35]="1970-01-01 00:00:00 (UTC-3)\n"; 	//seteado en Buenos Aires
	transformTime(str,timeInSec);
	
	write(1,str,35);

	return 0;
}


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












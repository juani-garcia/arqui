
int read(int fileDescriptor,char * buffer ,int length);
int write(int fileDescriptor,char * buffer,int length);
int openf(const char *  fileName);
int closef(int fileName);

int main(int argc, const char *argv[]) {
    
  char string2[10];
  char string1[] = "Hello 1234";
  if (argc != 4) {
    return -7; //errno 7: Argument List to long
  }

    int f1 = openf(argv[1]);
    if (f1 < 0) return f1; //Chequeoo
  	int f2 = openf(argv[2]);
    if (f2 < 0) return f2;
    int f3 = openf(argv[3]);
    if (f3 < 0) return f3;



    int test = read(f1,string1,10);
    if (test < 0) return test;
    test = read(f2,string2,10);
    if (test < 0) return test;
    write(1, string1, 10);
    write(1, "fue leido de a.txt \n", 20);

    test = write(f3,string1,10);
    if (test < 0) return test;
    test = write(f3,string2,10);
    if (test < 0) return test;

    closef(f1);
    closef(f2);
    closef(f3);

    return 0;
}

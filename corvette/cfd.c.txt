//A disc format detector fot the Corvette - Corvette format detector - CFD
#include<stdio.h>
int main(int argc, char **argv) {
   FILE *f;
   char b[32];
   if (argc != 2) {
      fprintf(stderr, "USAGE: cfd DISK-IMAGE\n");
      return 1;
   }
   if ((f = fopen(argv[1], "r")) == 0) {
      fprintf(stderr, "can't open image %s\n", argv[1]);
      return 2;
   }
   if (fread(b, 1, 32, f) != 32)  {
L1:   fprintf(stderr, "image %s is broken\n", argv[1]);
      return 3;
   }
   if (b[29] == 1) printf("korvet1");
   else if (b[29] == 2) printf("korvet");
   else if (b[29] == 3) printf("korvet3");
   else if (b[29] == 4) printf("korvet4");
   else goto L1;
   fclose(f);
   return 0;
}


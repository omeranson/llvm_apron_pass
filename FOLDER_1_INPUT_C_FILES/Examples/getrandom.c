#define min(a,b) ((a)<(b)?(a):(b))
#define __user

typedef unsigned int uint;
#define BUFSIZE 4096
#define RNDSIZE 1024
#define EFAULT 5

long getrandom(char __user *buf, 
               uint s, 
               uint f) {
 char *q = buf;
 uint i;
 char tmp[RNDSIZE];
 // ... 
 if (s == 0) return 0;
 uint n = min(s,BUFSIZE);
 // ...
 while (n) {
  // ...  
  extract_buf(tmp);
  i = min(n,RNDSIZE);
  if (copy_to_user(q, tmp, i))  
   return -EFAULT;
  n -= i; q += i;  
  // TODO update may-alias q->q+i
 }
 // ...
 return s;
}

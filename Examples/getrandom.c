#define min(a,b) ((a)<(b)?(a):(b))
#define __user

typedef unsigned int uint;
#define BUFSIZE 4096
#define RNDSIZE 1024
#define EFAULT 5

__attribute__((always_inline)) long extract_random(char __user *buf, uint count, int r) {
 if (r == 0) {
   return 0;
 }
 if (r < 0) {
   return r;
 }
 char tmp[RNDSIZE];
 char *q = buf;
 uint i;
 long n = min(count,BUFSIZE);
 while (n) {
  // ...  
  extract_buf(tmp);
  i = min(n,RNDSIZE);
  if (copy_to_user(q, tmp, i))  
   return -EFAULT;
  n -= i; q += i;  
 }
 return count;
}

long getrandom(char __user *buf, 
               uint s, 
               uint f) {
 if (s == 0) return 0;
 while (1) {
   long n = extract_random(buf, s, g());
   if (n < 0) {
     return n;
   }
   h(n);
   if (n > 0) {
     return n;
   }
 }
}

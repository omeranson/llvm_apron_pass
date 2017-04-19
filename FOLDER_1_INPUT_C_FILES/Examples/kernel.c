#include <stdint.h>
char c;
unsigned uSize;

//int write(int fd, char * buf, unsigned * size) {
//	add_user_pointer(buf, buf, 0);
//	add_user_pointer(size, size, 0);
//	char buffer[] = "Hello world. This is a string";
//	uint64_t uChar = 0;
//	if (c > 0) {
//		uChar = 1;
//	}
//	get_user(uChar, size);
//	if (c > sizeof(buffer)) {
//		get_user(uSize, size);
//		put_user(sizeof(buffer), size);
//		uSize = sizeof(buffer);
//	}
//	copy_to_user(buf, buffer, uSize);
//	return uSize;
//}

int write(int fd, char * buf, unsigned * size) {
	unsigned uSize = random();
	add_user_pointer(buf, buf, 0);
	add_user_pointer(size, size, 0);
	char buffer[] = "Hello world. This is a string";
	get_user(uSize, size);
	put_user(sizeof(buffer), size);
	uSize = sizeof(buffer);
	copy_to_user(buf, buffer, uSize);
	return uSize;
}

int write1(int fd, char * buf, unsigned * size) {
	unsigned uSize = random();
	add_user_pointer(buf, buf, 0);
	add_user_pointer(size, size, 0);
	char buffer[] = "Hello world. This is a string";
	get_user(uSize, size);
	get_user((uint64_t)c, size);
	return 0;
}

int write2(int fd, char * buf, unsigned * size) {
	unsigned uSize = random();
	add_user_pointer(buf, buf, 0);
	add_user_pointer(size, size, 0);
	char buffer[] = "Hello world. This is a string";
	get_user(uSize, size);
	if (uSize > sizeof(buffer)) {
		uSize = sizeof(buffer);
		put_user(uSize, size);
	}
	copy_to_user(buf, buffer, uSize);
	return uSize;
}

int write3(int fd, int offset, char * buf, unsigned * size) {
	unsigned uSize = random();
	add_user_pointer(buf, buf, 0);
	add_user_pointer(size, size, 0);
	char * buf2 = &buf[offset];
	add_user_pointer(buf2, buf, offset);
	char buffer[] = "Hello world. This is a string";
	copy_to_user(buf2, buffer, sizeof(buffer));
	return uSize;
}

int write4(int fd, int offset, char * buf, unsigned * size) {
	unsigned uSize = random();
	add_user_pointer(buf, buf, 0);
	add_user_pointer(size, size, 0);
	char * buf2 = &buf[offset];
	add_user_pointer(buf2, buf, offset);
	char buffer[] = "Hello world. This is a string";
	get_user(uSize, size);
	if (uSize > sizeof(buffer)) {
		uSize = sizeof(buffer);
		put_user(uSize, size);
	}
	copy_to_user(buf2, buffer, uSize);
	return uSize;
}

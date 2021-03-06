
add.o: add.c add.h
	gcc -c add.c

libadd.a: add.o
	ar crv libadd.a add.o
	ar t libadd.a
	size libadd.a

libmyprint.so: myprint.c
	rm -f libmyprint.so
	gcc -o libmyprint.so.1.0.0 myprint.c -shared -fPIC
	ln -s libmyprint.so.1.0.0 libmyprint.so

test: libadd.a test.c libmyprint.so 
	gcc -o test test.c -ladd -lmyprint -L.

clean:
	rm *.a *.o *.so test

run:
	LD_LIBRARY_PATH=. ./test

# two ways to make target executable file.
#LIBRARY_PATH=. gcc -o test test.c -ladd
#gcc -o test test.c -ladd -L.


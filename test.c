#include "add.h"

#include <stdio.h>

extern void cout(const char * message);
int main(void)
{
	printf("%d, %d\n", add(3,5), sub(3,5));
	cout("Here is from cout\n");
}

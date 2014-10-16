#include <stdlib.h>
#include <stdio.h>
#include <windows.h>

typedef int (*startFunction)(int numberOfArguments, const char** args);
typedef int (*emptyFunction)();

int main(int argc, const char* argv[]){
	
	HMODULE libHandle = LoadLibrary("libhello.dll");
	if(libHandle == NULL){
		printf("impossible to load library\n");
		exit(1);
	}
	
	emptyFunction empty = (emptyFunction) GetProcAddress(libHandle, "emptyMethod");
	if(empty == NULL){
		printf("impossible to get function emptyMethod\n");
		exit(1);
	}
	printf("result is %d\n", empty());

	startFunction start = (startFunction) GetProcAddress(libHandle, "start");
	if(start == NULL){
		printf("impossible to get function start\n");
		exit(1);
	}
	start(argc, argv);
}
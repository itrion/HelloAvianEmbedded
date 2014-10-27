#include <stdlib.h>
#include <stdio.h>
#include <dlfcn.h>

typedef int (*startFunction)(int numberOfArguments, const char** args);

int main(int argc, const char* argv[]){
	void* libHandle = dlopen("hello", RTLD_LAZY);
	if(libHandle == NULL){
		printf("impossible to load library\n");
		exit(1);
	}
	startFunction start = (startFunction) dlsym(libHandle, "start");
	if (start == NULL){
		printf("impossible to get the start function\n");
		exit(1);
	}
	start(argc, argv);
	dlclose(libHandle);
}

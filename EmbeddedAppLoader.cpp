#include <stdlib.h>
#include <dlfcn.h>

typedef int (*startFunction)(int numberOfArguments, const char** args);

int main(int argc, const char* argv[]){
	void* libHandle = dlopen("hello", RTLD_LAZY);
	startFunction start = (startFunction) dlsym(libHandle, "start");
	start(argc, argv);
	dlclose(libHandle);
}
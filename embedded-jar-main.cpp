#include "stdint.h"
#include "jni.h"
#include "stdlib.h" 

#if (defined __MINGW32__) || (defined _MSC_VER)
#  define EXPORT __declspec(dllexport)
#else
#  define EXPORT __attribute__ ((visibility("default")))   __attribute__ ((used))
#endif

extern "C" void __cxa_pure_virtual(void) { abort(); }

#ifdef __cplusplus
extern "C" {
#endif

  EXPORT void emptyMethod(){
    printf("this is an empty mehtod\n");
  }

  EXPORT int start(int ac, const char** av) {
    JavaVMInitArgs vmArgs;
    vmArgs.version = JNI_VERSION_1_2;
    vmArgs.nOptions = 2;
    vmArgs.ignoreUnrecognized = JNI_TRUE;
    JavaVMOption options[vmArgs.nOptions];
    vmArgs.options = options;

    options[0].optionString = const_cast<char*>("-Xbootclasspath:/Users/itrion/SIANI/boot.jar");
    options[1].optionString = const_cast<char*>("-Davian.bootstrap=hello");

    JavaVM* vm;
    void* env;
    JNI_CreateJavaVM(&vm, &env, &vmArgs);
    printf("Created VM\n");
    JNIEnv* e = static_cast<JNIEnv*>(env);
    jclass c = e->FindClass("Hello");
    if (not e->ExceptionCheck()) {
      printf("found class Hello\n");
      jmethodID m = e->GetMethodID(c, "<init>", "()V");
      if (not e->ExceptionCheck()) {
        e->NewObject(c, m);
        if (e->ExceptionCheck()){
          printf("cant create FooClass object");
        }
      }
    }
    

    int exitCode = 0;
    if (e->ExceptionCheck()) {
      exitCode = -1;
      e->ExceptionDescribe();
    }

    vm->DestroyJavaVM();

    return exitCode;
  }

  int main(int argc, char const *argv[])
  {
    return start(argc, argv);
  }


#ifdef __cplusplus
}
#endif

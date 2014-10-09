#!/bin/bash
rm *.o
rm *.class
rm *.dylib
rm hello
rm EmbeddedAppLoader

echo "############## compiling ############"
echo
rm boot.jar
cp classpath.jar boot.jar
javac -bootclasspath boot.jar Hello.java
jar u0f boot.jar *.class

mv boot.jar ../../
i686-w64-mingw32-g++ -fno-exceptions -fno-rtti -I"$JAVA_HOME/include" -I"$JAVA_HOME/include/win32" -D_JNI_IMPLEMENTATION_ -c embedded-jar-main.cpp -o main.o

echo
echo "#################### hello ########################"
echo

i686-w64-mingw32-dlltool -z hello.def *.o
i686-w64-mingw32-dlltool -d hello.def -e hello.exp
i686-w64-mingw32-gcc hello.exp *.o -L../../win32/lib -lmingwthrd -lm -lz -lws2_32 \
    -lIphlpapi -mwindows -mconsole -o hello && ./hello && rm hello

i686-w64-mingw32-gcc hello.exp *.o -L../../win32/lib -lmingwthrd -lm -lz -lws2_32 \
    -lIphlpapi -mwindows -shared -o libhello.dll 

echo
echo "#################### EmbeddedAppLoader.cpp ########################"
echo
i686-w64-mingw32-g++ EmbeddedAppLoader.cpp -o EmbeddedAppLoader && ./EmbeddedAppLoader


echo
echo "#################### EmbeddedAppLoader.java ########################"
echo

javac -classpath jna.jar EmbeddedAppLoader.java LibraryInterface.java

java -cp .:jna.jar EmbeddedAppLoader
#!/bin/bash
rm *.o
rm *.class
rm *.dll
rm hello
rm EmbeddedAppLoader

echo "############## compiling ############"
echo
rm boot.jar
cp classpath.jar boot.jar
javac -bootclasspath boot.jar Hello.java
jar u0f boot.jar *.class

i686-w64-mingw32-g++ -fno-exceptions -fno-rtti -I"$JAVA_HOME/include" -I"$JAVA_HOME/include/win32" -D_JNI_IMPLEMENTATION_ -D__WIN32__ -c embedded-jar-main.cpp -o main.o

echo
echo "#################### hello ########################"
echo

#i686-w64-mingw32-gcc *.o libavian/win32Objects/*.o -Lwin32/lib -lmingwthrd -lm -lz -lws2_32 \
#  -lIphlpapi -mwindows -mconsole -o hello && ./hello && rm hello


i686-w64-mingw32-g++ *.o libavian/win32Objects/*.o \
	-Lwin32/lib -lmingwthrd -lm -lz -lws2_32 -lIphlpapi \
	-static-libgcc \
	-shared -o libhello.dll

echo
echo "#################### EmbeddedAppLoader.cpp ########################"
echo

gcc -g EmbeddedAppLoaderWindows.cpp -o EmbeddedAppLoader && ./EmbeddedAppLoader


echo
echo "#################### EmbeddedAppLoader.java ########################"
echo

javac -classpath jna.jar EmbeddedAppLoaderJava.java LibraryInterface.java

java -classpath "./;jna.jar" EmbeddedAppLoaderJava


#!/bin/bash
rm *.o
rm *.class
rm *.so
rm hello
rm EmbeddedAppLoader

echo "############## compiling ############"
echo
rm boot.jar
cp classpath.jar boot.jar
javac -bootclasspath boot.jar Hello.java
jar ufv0 boot.jar *.class

g++ -g -fPIC -I$JAVA_HOME/include -I$JAVA_HOME/include/linux -D_JNI_IMPLEMENTATION_ -c embedded-jar-main.cpp -o main.o

echo
echo "#################### hello ########################"
echo

g++ -rdynamic *.o libavian/linux64Objects/*.o -lpthread -lz -ldl -o hello && ./hello

g++ -rdynamic *.o libavian/linux64Objects/*.o -lpthread -lz -ldl -shared -o libhello.so


echo
echo "#################### EmbeddedAppLoader.cpp ########################"
echo

g++ -g EmbeddedAppLoader.cpp -ldl -o EmbeddedAppLoader && ./EmbeddedAppLoader


echo
echo "#################### EmbeddedAppLoader.java ########################"
echo

javac -classpath jna.jar EmbeddedAppLoaderJava.java LibraryInterface.java

java -cp .:jna.jar EmbeddedAppLoaderJava

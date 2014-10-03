#!/bin/bash
rm *.o
rm boot.jar
rm *.class


echo "############## compiling ############"
echo
rm boot.jar
cp classpath.jar boot.jar
javac -bootclasspath boot.jar Hello.java
jar u0f boot.jar *.class

g++ -fno-exceptions -fno-rtti -I"$JAVA_HOME/include" -I"$JAVA_HOME/include/darwin" -D_JNI_IMPLEMENTATION_ -c embedded-jar-main.cpp -o main.o

echo
echo "#################### hello ########################"
echo

g++ -rdynamic *.o libavian/*.o -lpthread -ldl -lz -o hello -framework CoreFoundation && ./hello

g++ -rdynamic *.o libavian/*.o -lpthread -ldl -lz -shared -o libhello.dylib -framework CoreFoundation

echo
echo "#################### EmbeddedAppLoader.cpp ########################"
echo
g++ EmbeddedAppLoader.cpp -o EmbeddedAppLoader -ldl && ./EmbeddedAppLoader


echo
echo "#################### EmbeddedAppLoader.java ########################"
echo

javac -classpath jna.jar EmbeddedAppLoader.java LibraryInterface.java

java -cp .:jna.jar EmbeddedAppLoader
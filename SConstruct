import os
import glob

javaHome = os.environ["JAVA_HOME"];
os.environ["CXX"] = "/usr/bin/g++"
avianObjects = glob.glob("libavian/linux64Objects/*.o")


Program(
	target = "hello",
	source = avianObjects + ["embedded-jar-main.cpp"],
	LIBS = ["pthread", "dl", "z"],
	CPPPATH = [javaHome + "/include", javaHome + "/include/linux"])

SharedLibrary(
	target = "hello",
	source = avianObjects + ["embedded-jar-main.cpp"],
	LIBS = ["pthread", "dl", "z"],
	CPPPATH = [javaHome + "/include", javaHome + "/include/linux"],
	STATIC_AND_SHARED_OBJECTS_ARE_THE_SAME = 1)

Program(
	target = "EmbeddedAppLoader",
	source = ["EmbeddedAppLoader.cpp"],
	LIBS = ["hello", "dl"],
	LIBPATH = ["."])

Java(target = ".", 
	source = ["EmbeddedAppLoaderJava.java", "LibraryInterface.java", "jna.embedded-jar-main"],
	JAVACFLAGS = ["-classpath", "jna.jar"])


os.system("echo \"#################### hello ########################\"")
os.system("./hello")
os.system("echo \"#################### EmbeddedAppLoader ########################\"")
os.system("./EmbeddedAppLoader")
os.system("echo \"#################### EmbeddedAppLoaderJava ########################\"")
os.system("java -cp .:jna.jar EmbeddedAppLoaderJava")
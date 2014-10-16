import com.sun.jna.*;

public class EmbeddedAppLoaderJava {
	
	public static void main(String[] args) {
		LibraryInterface library = (LibraryInterface) Native.loadLibrary("hello", LibraryInterface.class);
		library.start(0);
	}
}
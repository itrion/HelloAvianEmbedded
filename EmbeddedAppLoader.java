import com.sun.jna.*;

public class EmbeddedAppLoader {
	
	public static void main(String[] args) {
		LibraryInterface library = (LibraryInterface) Native.loadLibrary("hello", LibraryInterface.class);
		library.emptyMethod();
	}
}
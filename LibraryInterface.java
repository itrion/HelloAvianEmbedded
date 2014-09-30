import com.sun.jna.*;

interface LibraryInterface extends Library{
	public int start(int numberOfArguments, String... arguments);
	public void emptyMethod();
}
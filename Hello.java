import java.util.*;

public class Hello {
  public static void main(String[] args) {
  	new Hello().execute();
  }

  public void execute(){
  	FooCLass foo = new FooCLass();
  	foo.addMessage("h");
  	foo.addMessage("e");
  	foo.addMessage("l");
  	foo.addMessage("l");
  	foo.addMessage("o");
  	for (String string : foo.getMessage()) {
  		System.out.println(string);
  	}
    System.out.println("world!");
  }

  public class FooCLass{
  	private ArrayList<String> list;

  	public FooCLass(){
  		this.list = new ArrayList<>();
  	}

  	public void addMessage(String string){
  		list.add(string);
  	}

  	public List<String> getMessage(){
  		return list;
  	}
  }
}

import java.util.*;

public class Hello {
  public static void main(String[] args) {
  	new Hello().execute();
  }

  public Hello(){
    System.out.println(new FooCLass().toString());
  }

  public void execute(){
    int three = 1 + 2;
    double five = java.lang.Math.sqrt(25);
    FooCLass foo = new FooCLass();
  	foo.add("h");
  	foo.add("e");
  	foo.add("l");
  	foo.add("l");
  	foo.add("o");
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

  	public void add(String string){
  		list.add(string);
  	}

  	public List<String> getMessage(){
  		return list;
  	}
  }
}

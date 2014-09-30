import java.util.*;

public class Hello {
  public static void main(String[] args) {
  	new Hello().execute();
  }

  public void execute(){
  	FooCLass foo = new FooCLass();
  	foo.addNumber(new Integer(1));
  	foo.addNumber(new Integer(2));
  	foo.addNumber(new Integer(3));
  	foo.addNumber(new Integer(4));
  	for (Integer number : foo.getNumbers()) {
  		System.out.println(number.toString());
  	}
    System.out.println("hello, world!");
  }

  public class FooCLass{
  	private ArrayList<Integer> list;

  	public FooCLass(){
  		this.list = new ArrayList<>();
  	}

  	public void addNumber(Integer number){
  		list.add(number);
  	}

  	public List<Integer> getNumbers(){
  		return list;
  	}
  }
}

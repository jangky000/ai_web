package test;

public class ColorInterMain {

  public static void main(String[] args) {
    ColorInter inter = new GreenImpl();
    inter.color();
    
    GreenImpl impl = (GreenImpl)inter;
    impl.color();

  }

}

package test;

public class ColorMain {

  public static void main(String[] args) {
    Color color = new Green();
    color.color();
    
    Green green = (Green)color;
    green.color();
  }

}

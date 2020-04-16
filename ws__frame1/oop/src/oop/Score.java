package oop;
 
public class Score {
  String name;
  int java;
  int jsp;
  int spring;
  int tot;
  int avg;
  
  public void setData(String name, int java, int jsp, int spring) {
    this.name = name;
    this.java = java;
    this.jsp = jsp;
    this.spring = spring;
    this.tot = this.java + this.jsp + this.spring;
    this.avg = (int)this.tot/3;
  }
  
  public void print() {
    System.out.println("¿Ã∏ß: " + this.name);
    System.out.println("java: " + this.java);
    System.out.println("jsp: " + this.jsp);
    System.out.println("spring: " + this.spring);
    
    System.out.println("√—¡°: " + this.tot + " / ∆Ú±’: " + this.avg);
  }
}
package test;
public class ComputerMain {
  public static void main(String[] args) {
    Computer1 computer = new Ram();
    computer.com();
    computer.com1();
    computer.com2();

    computer = new Vga();
    computer.com();
    computer.com1();
    computer.com2();

    computer = new Cpu();
    computer.com();
    computer.com1();
    computer.com2();
  }
}
package test;
class Vga implements Computer1 {
  @Override // 추상 메소드 구현
  public void com() {
    System.out.println("지포스 2080ti");
  }
  public void com1() {
    System.out.println("지포스 2070");
  }
  public void com2() {
    System.out.println("지포스 2060");
  }
}
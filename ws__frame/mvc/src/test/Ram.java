package test;
class Ram implements Computer1 {
  @Override // 추상 메소드 구현
  public void com() {
    System.out.println("16G");
  }
  public void com1() {
    System.out.println("8G");
  }
  public void com2() {
    System.out.println("4G");
  }
}
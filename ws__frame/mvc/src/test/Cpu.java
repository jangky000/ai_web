package test;
class Cpu implements Computer1 {
  @Override // �߻� �޼ҵ� ����
  public void com() {
    System.out.println("i9");
  }
  public void com1() {
    System.out.println("i7");
  }
  public void com2() {
    System.out.println("i5");
  }
}
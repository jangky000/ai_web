package test;
class Vga implements Computer1 {
  @Override // �߻� �޼ҵ� ����
  public void com() {
    System.out.println("������ 2080ti");
  }
  public void com1() {
    System.out.println("������ 2070");
  }
  public void com2() {
    System.out.println("������ 2060");
  }
}
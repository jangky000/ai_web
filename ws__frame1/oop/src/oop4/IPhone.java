package oop4;

public class IPhone implements Smartphone {

  @Override
  public void map() {
    System.out.println("Apple 맵 지원");
  }

  @Override
  public void nfc() {
    System.out.println("교통 카드 지원");
  }

}

package oop;
 
public class MovieMain {
 
  public static void main(String[] args) {
    Movie movie = new Movie();
    movie.print("���� ������");
    movie.print("�� ����Ʈ", "��");
    movie.print("���ҽý�Ʈ", "��",  120);
    movie.print("������2", "��", 131, 7.6, 2016);
    
    String[] Exit = { "������", "����", "��ν�", "����ȯ", "������"};
//    String[] Exit = new String[5];
//    Exit[0] = "������";
//    Exit[1] = "����";
//    Exit[2] = "��ν�";
//    Exit[3] = "����ȯ";
//    Exit[4] = "������";
    
    String[] flower = {"������", "������", "�ѿ���", "�ֹ���"};
//    String[] flower = new String[4];
//    flower[0] = "������";
//    flower[1] = "������";
//    flower[2] = "�ѿ���";
//    flower[3] = "�ֹ���";
    
    movie.print("Exit", Exit);
    movie.print("��β�", flower);
    
    movie.print2("Exit", Exit);
    movie.print2("��β�", flower);
    
    
    String[] ac1 = {"����ƿ��", "ũ����ư ����"};
    String[] ac2 = {"��Ʋ��"};
    String[] ac3 = {};
    movie.print2("����", ac1);
    movie.print2("��ȭ", ac2);
    movie.print2("��ȭ", ac3);
    
    
  }
 
}
  
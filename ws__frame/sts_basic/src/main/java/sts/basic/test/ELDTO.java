package sts.basic.test;
 
public class ELDTO {
  private String movie;
  private String name;
  
  // �⺻ ������
  public ELDTO(){
    this.movie = "�ϻ�";
    this.name = "������";
  }
  
  public ELDTO(String movie, String name){
    this.movie = movie;
    this.name = name;
  }
 
  public String getMovie() {
    System.out.println("getMovie() ȣ���");
    return movie;
  }
 
  public void setMovie(String movie) {
    this.movie = movie;
  }
  
  public String getName() {
    System.out.println("getName() ȣ���");
    
    return name;
  }
 
  public void setName(String name) {
    this.name = name;
  }
 
} 
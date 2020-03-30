package oop;
 
public class MeanMain {
 
  public static void main(String[] args) {
    Mean mean = new Mean();
    mean.avg(90, 100);
    mean.avg(90, 92, 86);
    mean.avg(80, 75, 79.2);
    mean.avg(65.5,  78.7, 93.5);
    
    mean.avg("왕눈이",  80, 100, 90);
    mean.avg("아로미",  80, 90, 100);
    mean.avg("개구리",  60, 80, 70);
    mean.avg("투투",  65, 78, 90);    
    mean.avg("개미",  68, 72, 85); 
    
    int[] datas = {86, 95, 65, 85, 75}; // 5
    mean.avg(datas);
 
    int[] datas2 = {86, 95, 65, 85, 75, 100}; // 6
    mean.avg(datas2);
 
    int[] datas3 = {86, 95, 65}; // 3
    mean.avg(datas3);
    
  }
 
}
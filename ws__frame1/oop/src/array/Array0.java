package array;

public class Array0 {
  public static void main(String[] args) {
    // ���ڿ� �迭�� ���ڿ��� ũ�⸸ŭ �޸𸮸� �Ҵ����.
    String[] dev = new String[5];
    dev[0] = "JAVA";
    dev[1] = "HTML5";
    dev[2] = "CSS3";
    dev[3] = "Javascript";
    dev[4] = "JSP";
    
    System.out.println(dev[0]);
    System.out.println(dev[1]);
    System.out.println(dev[2]);
    System.out.println(dev[3]);
    System.out.println(dev[4]);
    System.out.println("�迭�� ũ��: " + dev.length);
    System.out.println("-------------------");
    
    int[] years = new int[5];
    years[0] = 2013;
    years[1] = 2014;
    years[2] = 2015;
    years[3] = 2016;
    years[4] = 2017;
//    years[5] = 2018;
//    years[6] = 2019;
    // years[7] = 2019;  
    // java.lang.ArrayIndexOutOfBoundsException
    // System.out.println(years[7]);    
    
    int index = -1;
    while(true) {
      index = index + 1;
      System.out.println(dev[index]);
      
      if(index == 4) {
        break;
      }
    }
    
    index = 0;
    while(true) {
      System.out.println(years[index]);

      if(index == (years.length-1)) {
        break;
      }
      index = index+1;
    }
   
  }
}
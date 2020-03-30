package array;
 
public class Array2 {
 
  public static void main(String[] args) {
    int[][] score = new int[3][2];
    
    score[0][0] = 80; score[0][1] = 100;
    score[1][0] = 75; score[1][1] = 85;
    score[2][0] = 90; score[2][1] = 95;
    
    System.out.println(score[0][0] + ", " + score[0][1]);
    System.out.println(score[1][0] + ", " + score[1][1]);
    System.out.println(score[2][0] + ", " + score[2][1]);
    
  }
 
}
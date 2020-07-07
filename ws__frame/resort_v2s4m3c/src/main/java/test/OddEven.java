package test;

public class OddEven {
  
  
  public void examMethod() {
    int odd = 0;
    int even = 0;
    int odd_sum = 0;
    int even_sum = 0;
    
    
    int arrs[] = {1,2,3,4,5,6,7,8, 9, 10};
    
    for(int arr:arrs) {
      if(arr%2 == 0) {
        even++;
        even_sum+=arr;
      }else {
        odd++;
        odd_sum += arr;
      }
    }
    
    System.out.println("odd: " + odd);
    System.out.println("odd_sum: " + odd_sum);
    System.out.println("even: " + even);
    System.out.println("even_sum: " + even_sum);
  }
  
}

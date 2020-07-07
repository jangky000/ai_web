package test;
 
public class CarProc {
  public void calc(CarVO carVO) {
 
    int tot_ija = (int) (carVO.getWon() * carVO.getRest() / 100) * (carVO.getPeriod() / 12);
    carVO.setTot_ija(tot_ija);
 
    int tot_input = carVO.getWon() + carVO.getTot_ija();
    carVO.setTot_input(tot_input);
 
    int month = carVO.getTot_input() / carVO.getPeriod();
    carVO.setMonth(month);
 
  }
 
  // Test
  public static void main(String[] args) {
    CarProc carProc = new CarProc();
    CarVO carVO = new CarVO(5000000, 10.5, 24);
    carProc.calc(carVO);
    System.out.println(carVO.toString());
    
  }
 
}
package test;
 
public class CarVO {
  private int won;
  private int period;
  private double rest;
  private int tot_ija;
  private int tot_input;
  private int month;
  
  public CarVO(){
    
  }
  
  public CarVO(int won, double rest , int period){
    this.won = won;
    this.rest = rest;
    this.period =period;
  }
 
  public int getWon() {
    return won;
  }
 
  public void setWon(int won) {
    this.won = won;
  }
 
  public int getPeriod() {
    return period;
  }
 
  public void setPeriod(int period) {
    this.period = period;
  }
  
  public double getRest() {
    return rest;
  }
 
  public void setRest(double rest) {
    this.rest = rest;
  }
 
  public int getTot_ija() {
    return tot_ija;
  }
 
  public void setTot_ija(int tot_ija) {
    this.tot_ija = tot_ija;
  }
 
  public int getTot_input() {
    return tot_input;
  }
 
  public void setTot_input(int tot_input) {
    this.tot_input = tot_input;
  }
 
  public int getMonth() {
    return month;
  }
 
  public void setMonth(int month) {
    this.month = month;
  }
 
  @Override
  public String toString() {
    return "CarVO [won=" + won + ", period=" + period + ", rest=" + rest
        + ", tot_ija=" + tot_ija + ", tot_input=" + tot_input + ", month="
        + month + "]";
  }
 
  
}
package model;

public class T_order_flow {
  private Long o_f_id;
  private Long w_id;
  private Long o_id;
  private java.sql.Timestamp o_f_time;
  private Long o_f_state;
  private Double o_f_money;

  public Long getO_f_id() {
    return o_f_id;
  }

  public void setO_f_id(Long o_f_id) {
    this.o_f_id = o_f_id;
  }

  public Long getW_id() {
    return w_id;
  }

  public void setW_id(Long w_id) {
    this.w_id = w_id;
  }

  public Long getO_id() {
    return o_id;
  }

  public void setO_id(Long o_id) {
    this.o_id = o_id;
  }

  public java.sql.Timestamp getO_f_time() {
    return o_f_time;
  }

  public void setO_f_time(java.sql.Timestamp o_f_time) {
    this.o_f_time = o_f_time;
  }

  public Long getO_f_state() {
    return o_f_state;
  }

  public void setO_f_state(Long o_f_state) {
    this.o_f_state = o_f_state;
  }

  public Double getO_f_money() {
    return o_f_money;
  }

  public void setO_f_money(Double o_f_money) {
    this.o_f_money = o_f_money;
  }
}

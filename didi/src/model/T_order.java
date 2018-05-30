package model;

public class T_order {
  private Long o_id;
  private Long u_id;
  private Long o_t_id;
  private Double o_money;
  private java.sql.Timestamp o_now_time;
  private Long o_state;
  private Double u_location_x;
  private Double u_location_y;
  private Double d_location_x;
  private Double d_location_y;
  private java.sql.Timestamp o_start_time;
  private Long u_number;

  public Long getO_id() {
    return o_id;
  }

  public void setO_id(Long o_id) {
    this.o_id = o_id;
  }

  public Long getU_id() {
    return u_id;
  }

  public void setU_id(Long u_id) {
    this.u_id = u_id;
  }

  public Long getO_t_id() {
    return o_t_id;
  }

  public void setO_t_id(Long o_t_id) {
    this.o_t_id = o_t_id;
  }

  public Double getO_money() {
    return o_money;
  }

  public void setO_money(Double o_money) {
    this.o_money = o_money;
  }

  public java.sql.Timestamp getO_now_time() {
    return o_now_time;
  }

  public void setO_now_time(java.sql.Timestamp o_now_time) {
    this.o_now_time = o_now_time;
  }

  public Long getO_state() {
    return o_state;
  }

  public void setO_state(Long o_state) {
    this.o_state = o_state;
  }

  public Double getU_location_x() {
    return u_location_x;
  }

  public void setU_location_x(Double u_location_x) {
    this.u_location_x = u_location_x;
  }

  public Double getU_location_y() {
    return u_location_y;
  }

  public void setU_location_y(Double u_location_y) {
    this.u_location_y = u_location_y;
  }

  public Double getD_location_x() {
    return d_location_x;
  }

  public void setD_location_x(Double d_location_x) {
    this.d_location_x = d_location_x;
  }

  public Double getD_location_y() {
    return d_location_y;
  }

  public void setD_location_y(Double d_location_y) {
    this.d_location_y = d_location_y;
  }

  public java.sql.Timestamp getO_start_time() {
    return o_start_time;
  }

  public void setO_start_time(java.sql.Timestamp o_start_time) {
    this.o_start_time = o_start_time;
  }

  public Long getU_number() {
    return u_number;
  }

  public void setU_number(Long u_number) {
    this.u_number = u_number;
  }
}

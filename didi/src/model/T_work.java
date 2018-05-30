package model;

public class T_work {
  private Long w_id;
  private Long c_id;
  private Long u_id;
  private java.sql.Timestamp w_time;
  private Long w_state;
  private Double w_location_x;
  private Double w_location_y;

  public Long getW_id() {
    return w_id;
  }

  public void setW_id(Long w_id) {
    this.w_id = w_id;
  }

  public Long getC_id() {
    return c_id;
  }

  public void setC_id(Long c_id) {
    this.c_id = c_id;
  }

  public Long getU_id() {
    return u_id;
  }

  public void setU_id(Long u_id) {
    this.u_id = u_id;
  }

  public java.sql.Timestamp getW_time() {
    return w_time;
  }

  public void setW_time(java.sql.Timestamp w_time) {
    this.w_time = w_time;
  }

  public Long getW_state() {
    return w_state;
  }

  public void setW_state(Long w_state) {
    this.w_state = w_state;
  }

  public Double getW_location_x() {
    return w_location_x;
  }

  public void setW_location_x(Double w_location_x) {
    this.w_location_x = w_location_x;
  }

  public Double getW_location_y() {
    return w_location_y;
  }

  public void setW_location_y(Double w_location_y) {
    this.w_location_y = w_location_y;
  }
}

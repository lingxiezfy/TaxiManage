package model;

public class T_money_flow {
  private Long m_f_id;
  private Long r_t_id;
  private Long u_id;
  private java.sql.Timestamp m_f_time;
  private String m_f_account;
  private Double m_f_money;

  public Long getM_f_id() {
    return m_f_id;
  }

  public void setM_f_id(Long m_f_id) {
    this.m_f_id = m_f_id;
  }

  public Long getR_t_id() {
    return r_t_id;
  }

  public void setR_t_id(Long r_t_id) {
    this.r_t_id = r_t_id;
  }

  public Long getU_id() {
    return u_id;
  }

  public void setU_id(Long u_id) {
    this.u_id = u_id;
  }

  public java.sql.Timestamp getM_f_time() {
    return m_f_time;
  }

  public void setM_f_time(java.sql.Timestamp m_f_time) {
    this.m_f_time = m_f_time;
  }

  public String getM_f_account() {
    return m_f_account;
  }

  public void setM_f_account(String m_f_account) {
    this.m_f_account = m_f_account;
  }

  public Double getM_f_money() {
    return m_f_money;
  }

  public void setM_f_money(Double m_f_money) {
    this.m_f_money = m_f_money;
  }
}

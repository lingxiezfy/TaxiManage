package model;

public class T_comment {
  private Long m_id;
  private Long u_id;
  private Long p_id;
  private String m_content;
  private java.sql.Timestamp m_pub_time;
  private Long m_target;

  public Long getM_id() {
    return m_id;
  }

  public void setM_id(Long m_id) {
    this.m_id = m_id;
  }

  public Long getU_id() {
    return u_id;
  }

  public void setU_id(Long u_id) {
    this.u_id = u_id;
  }

  public Long getP_id() {
    return p_id;
  }

  public void setP_id(Long p_id) {
    this.p_id = p_id;
  }

  public String getM_content() {
    return m_content;
  }

  public void setM_content(String m_content) {
    this.m_content = m_content;
  }

  public java.sql.Timestamp getM_pub_time() {
    return m_pub_time;
  }

  public void setM_pub_time(java.sql.Timestamp m_pub_time) {
    this.m_pub_time = m_pub_time;
  }

  public Long getM_target() {
    return m_target;
  }

  public void setM_target(Long m_target) {
    this.m_target = m_target;
  }
}

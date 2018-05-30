package model;

public class T_post {
  private Long p_id;
  private Long u_id;
  private String p_title;
  private String p_content;
  private java.sql.Timestamp p_pub_time;

  public Long getP_id() {
    return p_id;
  }

  public void setP_id(Long p_id) {
    this.p_id = p_id;
  }

  public Long getU_id() {
    return u_id;
  }

  public void setU_id(Long u_id) {
    this.u_id = u_id;
  }

  public String getP_title() {
    return p_title;
  }

  public void setP_title(String p_title) {
    this.p_title = p_title;
  }

  public String getP_content() {
    return p_content;
  }

  public void setP_content(String p_content) {
    this.p_content = p_content;
  }

  public java.sql.Timestamp getP_pub_time() {
    return p_pub_time;
  }

  public void setP_pub_time(java.sql.Timestamp p_pub_time) {
    this.p_pub_time = p_pub_time;
  }
}

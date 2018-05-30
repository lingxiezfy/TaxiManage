package model;

public class T_feedback {
  private Long f_id;
  private Long u_id;
  private Long f_t_id;
  private String f_content;
  private Long f_target;

  public Long getF_id() {
    return f_id;
  }

  public void setF_id(Long f_id) {
    this.f_id = f_id;
  }

  public Long getU_id() {
    return u_id;
  }

  public void setU_id(Long u_id) {
    this.u_id = u_id;
  }

  public Long getF_t_id() {
    return f_t_id;
  }

  public void setF_t_id(Long f_t_id) {
    this.f_t_id = f_t_id;
  }

  public String getF_content() {
    return f_content;
  }

  public void setF_content(String f_content) {
    this.f_content = f_content;
  }

  public Long getF_target() {
    return f_target;
  }

  public void setF_target(Long f_target) {
    this.f_target = f_target;
  }
}

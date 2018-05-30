package model;

public class T_question {
  private Long q_id;
  private Long q_t_id;
  private String q_title;
  private String q_question;

  public Long getQ_id() {
    return q_id;
  }

  public void setQ_id(Long q_id) {
    this.q_id = q_id;
  }

  public Long getQ_t_id() {
    return q_t_id;
  }

  public void setQ_t_id(Long q_t_id) {
    this.q_t_id = q_t_id;
  }

  public String getQ_title() {
    return q_title;
  }

  public void setQ_title(String q_title) {
    this.q_title = q_title;
  }

  public String getQ_question() {
    return q_question;
  }

  public void setQ_question(String q_question) {
    this.q_question = q_question;
  }
}

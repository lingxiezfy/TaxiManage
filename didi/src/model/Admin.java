package model;

public class Admin {
    T_admin admin ;
    private String a_t_name;
    T_company company;

    public void setAdmin(T_admin admin) {
        this.admin = admin;
    }

    public T_admin getAdmin() {
        return admin;
    }

    public void setCompany(T_company company) {
        this.company = company;
    }

    public T_company getCompany() {
        return company;
    }

    public void setA_t_name(String a_t_name) {
        this.a_t_name = a_t_name;
    }

    public String getA_t_name() {
        return a_t_name;
    }
}

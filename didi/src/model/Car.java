package model;

public class Car extends T_car {
    private String c_t_name;

    private Host host;

    public void setC_t_name(String c_t_name) {
        this.c_t_name = c_t_name;
    }

    public String getC_t_name() {
        return c_t_name;
    }


    public Host getHost() {
        return host;
    }

    public void setHost(Host host) {
        this.host = host;
    }
}

package servlet;

import dao.Admin_dao;
import model.T_admin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/admin_register")
public class Admin_register_servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");

        response.setContentType("application/json;charset=utf-8");
        response.setCharacterEncoding("utf-8");

        String id = request.getParameter("id");

        String jsonStr = "";
        String status = "error";

        if(id != null && "right".equals(id)){
            String a_count = request.getParameter("a_count");
            String a_pwd = request.getParameter("a_pwd");
            int a_t_id = 0;
            try {
                a_t_id = Integer.parseInt(request.getParameter("a_t_id"));
            }catch (Exception e){
                a_t_id = 0;
                e.printStackTrace();
            }
            int cpn_id = 0;
            try{
                cpn_id = Integer.parseInt(request.getParameter("cpn_id"));
            }catch (Exception e){
                cpn_id = 0;
                e.printStackTrace();
            }

            System.out.println(a_count+"--"+a_pwd+"--"+a_t_id+"--"+cpn_id);

            Admin_dao admin_dao = new Admin_dao();
            if(a_t_id == 0){
                status="error";
            }else if(admin_dao.is_exist(a_count)){
                status = "re_count";
            }else {
                T_admin admin = new T_admin();

                admin.setA_t_id((long)a_t_id);
                admin.setA_count(a_count);
                admin.setA_password(a_pwd);

                if(admin_dao.register_admin(admin,cpn_id)){
                    status = "success";
                }else {
                    status = "un_know";
                }
            }
        }

        jsonStr = "{\"status\":[" +
                "{\"status\":\""+status+"\"}" +
                "]}";
        System.out.println(jsonStr);
        PrintWriter out = response.getWriter();
        out.print(jsonStr);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

package servlet;

import dao.Admin_dao;
import dao.Company_dao;
import model.T_a_type;
import model.T_company;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/admin_type_list")
public class Admin_type_servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json;charset=utf-8");
        response.setCharacterEncoding("utf-8");

        int a_t_id = 0;
        try {
            a_t_id = Integer.parseInt(request.getSession().getAttribute("a_t_id").toString());
        }catch (Exception e){
            a_t_id = 0;
            e.printStackTrace();
        }

        String jsonStr = "";
        jsonStr = "{\"a_type\":[";
        Admin_dao admin_dao = new Admin_dao();
        if(a_t_id > 0){
            List<T_a_type> list = admin_dao.get_admin_type_list(a_t_id);
            for(int i = 0;i<list.size();i++){
                jsonStr+="{\"a_t_id\":\""+list.get(i).getA_t_id()+"\","
                        +"\"a_t_name\":\""+list.get(i).getA_t_name()
                        +"\"}";
                if(i != list.size()-1){
                    jsonStr+=",";
                }
            }
        }

        jsonStr+="]}";
        System.out.print(jsonStr);
        PrintWriter out = response.getWriter();
        out.print(jsonStr);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

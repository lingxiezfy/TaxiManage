package servlet;

import dao.Admin_dao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/admin_delete")
public class Admin_delete_servle extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        response.setContentType("application/json;charset=utf-8");
        response.setCharacterEncoding("utf-8");

        String id = "";
        try {
            id = request.getParameter("id");
        }catch (Exception e){
            id = "";
        }
        System.out.println("id--"+id);
        String jsonStr = "";
        String status = "error";

        if("delete".equals(id)){
            int a_id = Integer.parseInt(request.getParameter("de_a_id"));

            System.out.println("re_a_id--"+a_id+"--");
            Admin_dao admin_dao = new Admin_dao();

            if(admin_dao.delete_admin_by_id(a_id)){
                status = "success";
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

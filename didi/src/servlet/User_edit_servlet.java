package servlet;

import dao.Admin_dao;
import dao.User_dao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/user_edit")
public class User_edit_servlet extends HttpServlet {
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

        if("edit".equals(id)){
            int a_id = Integer.parseInt(request.getParameter("re_a_id"));
            String a_pwd = request.getParameter("re_a_pwd");

            System.out.println("re_a_id--"+a_id+"--"+a_pwd);
            User_dao user_dao = new User_dao();

            if(user_dao.edit_pwd_by_id(a_id,a_pwd)){
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

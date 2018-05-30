package servlet;

import dao.Driver_dao;
import dao.User_dao;
import model.Driver;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/driver_mod")
public class Driver_mod_servle extends HttpServlet {
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

        if("mod".equals(id)){
            int a_id = Integer.parseInt(request.getParameter("de_a_id"));

            System.out.println("re_a_id--"+a_id+"--");
            Driver_dao driver_dao = new Driver_dao();

            if(driver_dao.mod_driver_by_id(a_id,2)){
                status = "success";
            }
        }else if("remod".equals(id)){
            int a_id = Integer.parseInt(request.getParameter("de_a_id"));

            System.out.println("re_a_id--"+a_id+"--");
            Driver_dao driver_dao = new Driver_dao();

            if(driver_dao.mod_driver_by_id(a_id,1)){
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

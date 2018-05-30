package servlet;

import dao.User_dao;
import model.T_user;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/user_register")
public class User_register_servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        response.setContentType("application/json;charset=utf-8");
        response.setCharacterEncoding("utf-8");

        String id = request.getParameter("id");

        String jsonStr = "";
        String status = "error";


        if(id.equals("right")){
            User_dao dao = new User_dao();
            String u_name = request.getParameter("u_name");
            if(!(u_name == null || "".equals(u_name)))
            if(dao.is_exist_by_name(u_name)){
                status = "re_name";

            }else {
                String u_phone_number = request.getParameter("u_phone_number");
                if(!(u_phone_number == null || "".equals(u_phone_number)))
                if(dao.is_exist_by_phone(u_phone_number)){
                    status = "re_phone";
                }else {
                    String u_id_card_number = request.getParameter("u_id_card_number");
                    if(!(u_id_card_number == null || "".equals(u_id_card_number))){
                        if(dao.is_exist_by_id_card(u_id_card_number)){
                            status = "re_id_card";
                        }else{
                            String u_password = request.getParameter("u_password");
                            T_user user = new T_user();

                            user.setU_name(u_name);
                            user.setU_phone_number(u_phone_number);
                            user.setU_password(u_password);
                            user.setU_id_card_number(u_id_card_number);

                            if(dao.register_user(user)){
                                status = "success";
                            }else {
                                status = "unknow";
                            }
                        }
                    }

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

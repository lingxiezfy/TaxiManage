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

@WebServlet("/user_login")
public class User_login_servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json;charset=utf-8");
        response.setCharacterEncoding("utf-8");

        String user_name = request.getParameter("user_name");
        String user_pwd = request.getParameter("user_pwd");

        User_dao user_dao = new User_dao();


        String jsonStr = "";
        String status = "no_user";
        jsonStr = "{\"status\":[{\"status\":\""+status+"\"}]}";

        //判断用户是否存在
        if(user_dao.is_exist_by_name(user_name)){

            T_user user = user_dao.get_user_by_name(user_name);

            if(user_pwd.equals(user.getU_password())){
                boolean is_driver = user_dao.isDriverByName(user_name);
                status = "success";
                jsonStr = "{\"status\":[{\"status\":\""+status+"\"}],\"user\":[{\"u_id\":\""+user.getU_id()
                        +"\",\"u_name\":\""+user.getU_name()
                        +"\",\"u_photo\":\""+user.getU_photo()
                        +"\",\"u_state\":\""+user.getU_state()
                        +"\",\"is_driver\":\""+is_driver+"\"}]}";

                request.getSession().setAttribute("u_name",user.getU_name());
                request.getSession().setAttribute("u_id",user.getU_id());
                request.getSession().setAttribute("u_photo",user.getU_photo());
                request.getSession().setAttribute("u_state",user.getU_state());
                request.getSession().setAttribute("is_driver",is_driver);

            }else {
                status = "error";
                jsonStr = "{\"status\":[{\"status\":\""+status+"\"}]}";
            }
        }


        System.out.print(jsonStr);
        PrintWriter out = response.getWriter();
        out.print(jsonStr);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

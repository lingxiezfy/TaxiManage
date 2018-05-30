package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin_logout")
public class Admin_logout_servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().removeAttribute("a_count");
        request.getSession().removeAttribute("a_id");
        request.getSession().removeAttribute("a_t_id");
        request.getSession().removeAttribute("cpn_id");
        request.getSession().removeAttribute("cpn_name");
        request.getSession().removeAttribute("cpn_ico");
        response.sendRedirect("admin/login.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

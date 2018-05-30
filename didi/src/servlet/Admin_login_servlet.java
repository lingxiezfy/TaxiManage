package servlet;

import dao.Admin_dao;
import dao.Company_dao;
import model.T_admin;
import model.T_company;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin_login")
public class Admin_login_servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        String a_count = request.getParameter("a_count");
        System.out.println("a_count:---->> "+ a_count);

        if(!(a_count == null || "".equals(a_count))){
            Admin_dao admin_dao = new Admin_dao();
            if(admin_dao.is_exist(a_count)){
                String a_pwd = request.getParameter("a_password");
                if(!(a_pwd == null || "".equals(a_pwd))){
                    T_admin admin = admin_dao.get_admin_by_name(a_count);
                    if(a_pwd.equals(admin.getA_password())){
                        int cpn_id = admin_dao.is_cpn_admin(admin.getA_id().intValue());
                        //如果是公司管理员，获取公司信息
                        if(cpn_id > 0){
                            Company_dao company_dao = new Company_dao();
                            T_company company =  company_dao.get_company_by_id(cpn_id);

                            request.getSession().setAttribute("cpn_id",company.getCpn_id());
                            request.getSession().setAttribute("cpn_ico",company.getCpn_ico());
                            request.getSession().setAttribute("cpn_name",company.getCpn_name());
                        }
                        request.getSession().setAttribute("a_id",admin.getA_id());
                        System.out.println(admin.getA_id());
                        request.getSession().setAttribute("a_count",a_count);
                        request.getSession().setAttribute("a_t_id",admin.getA_t_id());
                        request.getRequestDispatcher("admin_list").forward(request,response);
                    }else {
                        response.sendRedirect("admin/login.jsp?error=2");
                    }
                }
            }else {
                response.sendRedirect("admin/login.jsp?error=1");
            }
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

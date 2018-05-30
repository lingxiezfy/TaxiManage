package servlet;

import dao.Admin_dao;
import model.Admin;
import model.T_admin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

@WebServlet("/admin_list")
public class Admin_servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json;charset=utf-8");
        response.setCharacterEncoding("utf-8");

        int a_id = 0;
        int a_t_id = 0;
        int cpn_id = 0;
        try {
            a_id = Integer.parseInt(request.getSession().getAttribute("a_id").toString());
        }catch (Exception e){
            a_id = 0;
            e.printStackTrace();
        }
        try {
            a_t_id = Integer.parseInt(request.getSession().getAttribute("a_t_id").toString());
        }catch (Exception e){
            a_t_id = 0;
            e.printStackTrace();
        }
        try {
            cpn_id = Integer.parseInt(request.getSession().getAttribute("cpn_id").toString());
        }catch (Exception e){
            cpn_id = 0;
            e.printStackTrace();
        }
        System.out.println(a_id);
        String id = "";
        try {
            id = request.getParameter("id");
        }catch (Exception e){
            id = "";
        }

        String a_t_id_s ;
        try{
            a_t_id_s = request.getParameter("a_t_id_s");
        }catch (Exception e){
            a_t_id_s = "0";
        }
        int currPage ;
        int pageSize ;
        try {
            currPage = Integer.parseInt(request.getParameter("curr_page"));
        }catch (Exception e){
            currPage = 1;
            e.printStackTrace();
        }
        try {
            pageSize = Integer.parseInt(request.getParameter("page_size"));
        }catch (Exception e){
            pageSize = 1;
            e.printStackTrace();
        }


        HashMap<String ,String> sMap = new HashMap<>() ;
        sMap.put("a_t_id_s",a_t_id_s);

        if(a_id <= 0){
            response.sendRedirect("admin/login.jsp?error=3");
        }else {
            Admin_dao admin_dao = new Admin_dao();
            List<Admin> list = admin_dao.get_admin_list(a_id,a_t_id,cpn_id,currPage,pageSize,sMap);

            if("json".equals(id)){
                int totalCount = admin_dao.get_search_count(a_id,a_t_id,cpn_id,sMap);
                int totalPage = 0;
                String jsonStr = "";
                jsonStr = "{\"admin\":[";

                for(int i = 0;i<list.size();i++){
                    jsonStr+="{\"a_id\":\""+list.get(i).getAdmin().getA_id()+"\","
                            +"\"a_t_id\":\""+list.get(i).getAdmin().getA_t_id()+"\","
                            +"\"a_count\":\""+list.get(i).getAdmin().getA_count()+"\","
                            +"\"a_t_name\":\""+list.get(i).getA_t_name()+"\","
                            +"\"cpn_name\":\""+list.get(i).getCompany().getCpn_name()
                            +"\"}";
                    if(i != list.size()-1){
                        jsonStr+=",";
                    }
                }
                if (totalCount % pageSize == 0)
                    totalPage = totalCount / pageSize;
                else
                    totalPage = totalCount / pageSize + 1;
                jsonStr+="],\"page\":[{";
                jsonStr+="\"total_count\":\""+totalCount+"\"";
                jsonStr+=",\"total_page\":\""+totalPage+"\"";
                jsonStr+=",\"curr_page\":\""+currPage+"\"";
                jsonStr+="}]}";
                System.out.print(jsonStr);
                PrintWriter out = response.getWriter();
                out.print(jsonStr);
            }else {
                request.setAttribute("admin_list",list);
                request.getRequestDispatcher("admin/admin_manage.jsp").forward(request,response);

            }

        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

package servlet;

import dao.Company_dao;
import model.T_company;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/company_name_list")
public class Company_servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json;charset=utf-8");
        response.setCharacterEncoding("utf-8");

        String jsonStr = "";
        jsonStr = "{\"company\":[";
        Company_dao company_dao = new Company_dao();
        List<T_company> list = company_dao.get_company_list();
        for(int i = 0;i<list.size();i++){
            jsonStr+="{\"cpn_id\":\""+list.get(i).getCpn_id()+"\","
                    +"\"cpn_name\":\""+list.get(i).getCpn_name()
                    +"\"}";
            if(i != list.size()-1){
                jsonStr+=",";
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

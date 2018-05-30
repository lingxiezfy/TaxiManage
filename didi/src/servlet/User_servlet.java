package servlet;

import dao.Admin_dao;
import dao.User_dao;
import model.Admin;
import model.T_user;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@WebServlet("/user_list")
public class User_servlet extends HttpServlet {
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

        String u_state_s ;
        try{
            u_state_s = request.getParameter("u_state_s");
        }catch (Exception e){
            u_state_s = "0";
        }
        String u_name_s ;
        try{
            u_name_s = request.getParameter("u_name_s");
        }catch (Exception e){
            u_name_s = "";
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
        sMap.put("u_state_s",u_state_s);
        sMap.put("u_name_s",u_name_s);

            User_dao user_dao = new User_dao();
            List<T_user> list ;

            if("json".equals(id)){


                int totalCount = user_dao.get_search_count(sMap);
                int totalPage = 0;
                String jsonStr = "";
                jsonStr = "{\"user\":[";
                list = user_dao.get_user_list(currPage,pageSize,sMap);
                for(int i = 0;i<list.size();i++){
                    jsonStr+="{\"u_id\":\""+list.get(i).getU_id()+"\","
                            +"\"u_name\":\""+list.get(i).getU_name()+"\","
                            +"\"u_phone_number\":\""+list.get(i).getU_phone_number()+"\","
                            +"\"u_id_card_number\":\""+list.get(i).getU_id_card_number()+"\","
                            +"\"u_sex\":\""+list.get(i).getU_sex()+"\","
                            +"\"u_birth_day\":\""+list.get(i).getU_birth_day()+"\","
                            +"\"u_credit\":\""+list.get(i).getU_credit()+"\","
                            +"\"u_state\":\""+list.get(i).getU_state()
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
            }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

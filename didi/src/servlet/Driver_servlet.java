package servlet;

import dao.Driver_dao;
import dao.User_dao;
import model.Driver;
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

@WebServlet("/driver_list")
public class Driver_servlet extends HttpServlet {
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

        int cpn_id;
        try {
            cpn_id = Integer.parseInt(request.getSession().getAttribute("cpn_id").toString());
        }catch (Exception e){
            cpn_id = 0;
            e.printStackTrace();
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

        //查询参数获取
        HashMap<String ,String> sMap = new HashMap<>() ;
        sMap.put("u_state_s",u_state_s);
        sMap.put("u_name_s",u_name_s);
        //调用dao层获取数据
            Driver_dao driver_dao = new Driver_dao();
            List<Driver> list = new ArrayList<>();

            if("json".equals(id)){


                int totalCount = driver_dao.get_search_count(cpn_id,sMap);
                int totalPage = 0;
                String jsonStr = "";
                jsonStr = "{\"driver\":[";
                list = driver_dao.get_driver_list(cpn_id,currPage,pageSize,sMap);
                for(int i = 0;i<list.size();i++){
                    jsonStr+="{\"u_id\":\""+list.get(i).getU_id()+"\","
                            +"\"d_real_name\":\""+list.get(i).getD_real_name()+"\","
                            +"\"d_car_class\":\""+list.get(i).getD_car_class()+"\","
                            +"\"d_first_issue\":\""+list.get(i).getD_first_issue()+"\","
                            +"\"d_valid_period\":\""+list.get(i).getD_valid_period()+"\","
                            +"\"d_licence_picture\":\""+list.get(i).getD_licence_picture()+"\","
                            +"\"d_id_f_picture\":\""+list.get(i).getD_id_f_picture()+"\","
                            +"\"d_id_b_picture\":\""+list.get(i).getD_id_b_picture()+"\","
                            +"\"u_credit\":\""+list.get(i).getU_credit()+"\","
                            +"\"d_state\":\""+list.get(i).getD_state()
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
